part of 'edit_profile_details_cubit.dart';

@immutable
sealed class EditProfileDetailsState {}

final class EditProfileDetailsInitial extends EditProfileDetailsState {}

final class EditProfileSuccessState extends EditProfileDetailsState {}

final class EditProfileFailedState extends EditProfileDetailsState {}



