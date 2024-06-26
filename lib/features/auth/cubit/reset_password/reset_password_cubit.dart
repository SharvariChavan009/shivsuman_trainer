import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:car_trainer_application/core/common/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial()) {}

  void resetFunction(String pass, String cpass) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var emailBox = await Hive.openBox("emailBox");
    emailBox.get("emailData");

    print("Email Variable --> ${emailBox.get("emailData")}}");

    var dio = Dio();

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    ));

    String emailData = emailBox.get("emailData");

    var response = await dio.request(
      ApiConstants.apiConfirmPasswordUrl,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: {
        "email": emailData,
        "password": pass,
        "password_confirmation": cpass
      },
    );

    emit(ResetPasswordLoadingState());

    if (response.statusCode == 200) {
      print(json.encode(response.data));

      emit(ResetPasswordSuccessState());
    } else {
      print(response.statusMessage);
      emit(ResetPasswordErrorState());
    }
  }
}
