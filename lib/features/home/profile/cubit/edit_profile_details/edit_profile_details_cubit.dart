import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:car_trainer_application/core/common/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'edit_profile_details_state.dart';

class EditProfileDetailsCubit extends Cubit<EditProfileDetailsState> {
  EditProfileDetailsCubit() : super(EditProfileDetailsInitial()) {}

  void editProfileDetailFunction(String email) async {
    var authBox = await Hive.openBox("authBox");

    String userToken = authBox.get("authToken");

    print("User Token --> $userToken");

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken',
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
      ApiConstants.apiEditProfileUrl,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: {"email": email},
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      emit(EditProfileSuccessState());
    } else {
      print(response.statusMessage);
      emit(EditProfileFailedState());
    }
  }
}
