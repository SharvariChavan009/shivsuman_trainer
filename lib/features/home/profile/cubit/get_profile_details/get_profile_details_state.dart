part of 'get_profile_details_cubit.dart';

@immutable
sealed class GetProfileDetailsState {}

final class GetProfileDetailsInitial extends GetProfileDetailsState {}

final class GetProfileDetailsSuccessState extends GetProfileDetailsState {
  User userDetails;

  GetProfileDetailsSuccessState({required this.userDetails});
}

final class GetProfileDetailsErrorState extends GetProfileDetailsState {}

final class GetProfileDetailsLoadingState extends GetProfileDetailsState {}
