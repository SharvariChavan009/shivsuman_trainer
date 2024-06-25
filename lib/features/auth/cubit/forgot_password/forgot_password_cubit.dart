import 'package:bloc/bloc.dart';
import 'package:car_trainer_application/core/common/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial()) {}

  void forgotPasswordFunction(String email) async {
    
    if ((email.isNotEmpty && EmailValidator.validate(email) == true)) {
      emit(ForgotPasswordLoadingState());
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

        Response response = await dio
            .post(ApiConstants.apiForgotPasswordUrl, data: {"email": email});

        if (response.statusCode == 200) {
          emit(ForgotPasswordSuccessState());
          email = "";
        }
      } catch (e) {
        emit(ForgotPasswordErrorState());
        print("Forgot password error");
      }
    }
  }
}
