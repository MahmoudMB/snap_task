import 'package:formz/formz.dart' show FormzInput;

import '../utils/enums/validations.dart';

class PasswordValidation extends FormzInput<String?, Validation> {
  const PasswordValidation.pure({String? password}) : super.pure(password);

  const PasswordValidation.dirty({String? password}) : super.dirty(password);

  @override
  Validation? validator(String? value) {
    final enteredValue = value?.trim();
    if (enteredValue != null && enteredValue.isEmpty) {
      return Validation.empty;
    } else if (enteredValue != null && enteredValue!.length < 6) {
      return Validation.invalidPassword;
    } else {
      return null;
    }
  }
}
