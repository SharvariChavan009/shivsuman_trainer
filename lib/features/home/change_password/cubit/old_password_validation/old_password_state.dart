part of 'old_password_cubit.dart';

@immutable
sealed class OldPasswordState {}

final class OldPasswordInitial extends OldPasswordState {}

class OldPasswordErrorState extends OldPasswordState {
  String errorMessage;

  OldPasswordErrorState({required this.errorMessage});
}
