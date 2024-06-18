import 'package:bloc/bloc.dart';
import 'package:car_trainer_application/core/common/validation_variables.dart';
import 'package:meta/meta.dart';


part 'textfield_validation_state.dart';

class TextfieldValidationCubit extends Cubit<TextfieldValidationState> {
  TextfieldValidationCubit() : super(TextfieldValidationInitial()) {}

  // TextFiled Validation Function
  void validate(String input) async {
    if (input.isEmpty) {
      ValidationAllVariables.textVar = false;
      ValidationAllVariables.tenantuserVar = false;
      ValidationAllVariables.roleVar = false;
      ValidationAllVariables.permissionVar = false;


      
      emit(TextValidationError('Field cannot be empty'));

      return await Future.delayed(const Duration(seconds: 3), () {
        emit(ValidationValid());
      });
    } else if (input.length < 3) {
      ValidationAllVariables.textVar = false;
      ValidationAllVariables.tenantuserVar = false;
      ValidationAllVariables.roleVar = false;
      ValidationAllVariables.permissionVar = false;



      emit(TextValidationError('Field must be at least 3 characters long'));
      return await Future.delayed(const Duration(seconds: 3), () {
        emit(ValidationValid());
      });
    } else {
      ValidationAllVariables.textVar = true;
      ValidationAllVariables.tenantuserVar = true;
      ValidationAllVariables.roleVar = true;
      ValidationAllVariables.permissionVar = true;



      emit(ValidationValid());
    }
  }
}
