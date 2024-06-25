import 'package:bloc/bloc.dart';
import 'package:car_trainer_application/core/common/api_constants.dart';
import 'package:car_trainer_application/core/common/widgets/c_list.dart';
import 'package:car_trainer_application/features/home/profile/model/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'get_profile_details_state.dart';

class GetProfileDetailsCubit extends Cubit<GetProfileDetailsState> {
  GetProfileDetailsCubit() : super(GetProfileDetailsInitial()) {
    getUserDetailsFunction();
  }

  void getUserDetailsFunction() async {
    var _token = await Hive.openBox("authBox");
    String userToken = _token.get("authToken");
    print("userToken - $userToken");

    var headers = {
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
      ApiConstants.apiProfileDetailsUrl,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      emit(GetProfileDetailsLoadingState());
      User userData = User.fromJson(response.data["data"]["user"]);

      emit(GetProfileDetailsSuccessState(userDetails:userData));
    } 
    else {
      print(response.statusMessage);

      emit(GetProfileDetailsErrorState());
    }
  }
}
