import 'package:bloc/bloc.dart';
import 'package:car_trainer_application/core/common/u_validations_all.dart';
import 'package:car_trainer_application/core/common/validation_variables.dart';
import 'package:meta/meta.dart';

part 'old_password_state.dart';

class OldPasswordCubit extends Cubit<OldPasswordState> {
  OldPasswordCubit() : super(OldPasswordInitial()) {}

  void oldPasswordlidationFunction(String pass) async {
    // if 2
    if (pass.isEmpty) {
      ValidationAllVariables.passwordVar = false;
      emit(OldPasswordErrorState(errorMessage: "Please enter a password"));
      return await Future.delayed(const Duration(seconds: 3), () {
        emit(OldPasswordInitial());
      });
    } else {
      if (ValidationsAll.isValidPassword(pass)) {
        ValidationAllVariables.passwordVar = true;

        emit(OldPasswordInitial());
      } else {
        ValidationAllVariables.passwordVar = false;

        emit(
            OldPasswordErrorState(errorMessage: "Please enter valid password"));
        return await Future.delayed(const Duration(seconds: 3), () {
          emit(OldPasswordInitial());
        });
      }
    }
  }
}
