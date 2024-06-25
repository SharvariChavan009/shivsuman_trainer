import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:car_trainer_application/core/common/api_constants.dart';
import 'package:car_trainer_application/core/common/validation_variables.dart';
import 'package:car_trainer_application/features/auth/presentation/forgot_password_screen.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit() : super(VerifyOtpInitial()) {}

  void verifyOTPFunction(String otp) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var emailBox = await Hive.openBox("emailBox");
    emailBox.get("emailData");

    print("Email Variable --> ${emailBox.get("emailData")}}");
    print("OTP --> $otp");

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
      ApiConstants.apiVerifyOTPUrl,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: {"email": "${emailData}", "otp": "${otp}"},
    );

    emit(VerifyOTPLoadingState());

    if (response.statusCode == 200) {
      print(json.encode(response.data));

      emit(VerifyOTPSuccessState());
    } else {
      print(response.statusMessage);
      emit(VerifyOTPErrorState());
    }
  }
}
