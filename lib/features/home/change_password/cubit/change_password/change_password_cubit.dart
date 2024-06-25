import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:car_trainer_application/core/common/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial()) {}

  void changePasswordFunction(String oldPass, String pass, String cpass) async {
    var authBox = await Hive.openBox("authBox");
    String UToken = authBox.get("authToken");

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $UToken'
    };

    var dio = Dio();

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    ));

    var response = await dio.request(
      ApiConstants.apiChangePasswordeUrl,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: {
        "old_password": oldPass,
        "password": pass,
        "password_confirmation": cpass
      },
    );

    emit(ChangePasswordLoadingState());

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      emit(ChangePasswordSuccessState());
    } else {
      print(response.statusMessage);
      emit(ChangePasswordErrorState());
    }
  }
}
