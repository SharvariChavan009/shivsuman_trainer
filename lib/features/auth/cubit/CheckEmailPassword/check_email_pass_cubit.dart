import 'package:bloc/bloc.dart';
import 'package:car_trainer_application/core/common/api_constants.dart';
import 'package:car_trainer_application/core/common/validation_variables.dart';
import 'package:dio/dio.dart';

import 'package:hive/hive.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:email_validator/email_validator.dart';

part 'check_email_pass_state.dart';

class CheckEmailPassCubit extends Cubit<CheckEmailPassState> {
  CheckEmailPassCubit() : super(CheckEmailPassInitial()) {}

  void Loginvalidation3(String email, String pass) async {
    // if 3
    if ((email.isNotEmpty && EmailValidator.validate(email) == true) &&
        (pass.length >= 6)) {
      print("In - Correct Validation");
      emit(LoadingState());
      try {
        var dio = Dio();

        dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
        ));

        Response response = await dio.post(ApiConstants.apiLoginUrl,
            data: {"email": email, "password": pass});
 

        if (response.statusCode == 200) {
        

          ValidationAllVariables.utoken =
              response.data["data"]; // get authToken

          // ------- Add AuthToken in Hive ----------
          var authBox = await Hive.openBox("authBox");
          authBox.put("authToken", response.data["data"]);
          //-----------------------------------------
          print("Token --> ${authBox.get("authToken")}");
          emit(LoginSuccessfulState());
          // email = "";
          // pass = "";
        }
      } catch (e) {
        emit(LoginFailedfulState());
        print("Login error");
      }
    }
  }
}
