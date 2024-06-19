import 'package:bloc/bloc.dart';
import 'package:car_trainer_application/core/common/u_validations_all.dart';
import 'package:car_trainer_application/core/common/validation_variables.dart';
import 'package:meta/meta.dart';


part 'confirmpassword_state.dart';

class ConfirmpasswordCubit extends Cubit<ConfirmpasswordState> {
  ConfirmpasswordCubit() : super(ConfirmpasswordInitial()) {}

  void ConfirmPassFunction(String pass, String cPass) async {
    // if 2
    if (cPass.isEmpty) {
      emit(ConfirmpassErrorState(errorMessage: "Please enter a password"));
      ValidationAllVariables.confirmpasswordVar = false;

      return await Future.delayed(const Duration(seconds: 3), () {
        emit(ConfirmpasswordInitial());
      });
    } else {
      if ((ValidationsAll.isValidPassword(cPass)) && (pass == cPass)) {
        ValidationAllVariables.confirmpasswordVar = true;
        emit(ConfirmpasswordInitial());
      } else {
        ValidationAllVariables.confirmpasswordVar = false;

        emit(
            ConfirmpassErrorState(errorMessage: "Please enter valid password"));
        return await Future.delayed(const Duration(seconds: 3), () {
          emit(ConfirmpasswordInitial());
        });
      }
    }
  }
}
