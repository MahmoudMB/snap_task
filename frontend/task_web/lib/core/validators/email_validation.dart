import 'package:formz/formz.dart' show FormzInput;

import '../utils/enums/validations.dart';

class EmailValidation extends FormzInput<String?, Validation> {
  const EmailValidation.pure({String? email}) : super.pure(email);
  const EmailValidation.dirty({String? email}) : super.dirty(email);

  @override
  Validation? validator(String? value) {
    final enteredValue = value?.trim();
    if (enteredValue != null && enteredValue.isEmpty) {
      return Validation.empty;
    } else if (enteredValue != null &&
        !RegExp(
          r"^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
        ).hasMatch(enteredValue)) {
      return Validation.invalidEmail;
    } else {
      return null;
    }
  }
}
