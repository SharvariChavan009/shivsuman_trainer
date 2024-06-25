part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordSuccessState extends ResetPasswordState {}

final class ResetPasswordErrorState extends ResetPasswordState {}

final class ResetPasswordLoadingState extends ResetPasswordState {}
