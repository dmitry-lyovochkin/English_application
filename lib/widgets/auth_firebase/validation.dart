// validation
String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return "Введите Email";
  }

  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) {
    return "Неверный формат Email";
  }

  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return "Введите пароль";
  }

  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword)) {
    return "Пароль должен быть не менее 6 символов. Одна заглавная буква, число и символ(Пример: Vignesh123!)";
  }

  return null;
}



String? validateFirstName(String? formFirstName) {
  if (formFirstName == null || formFirstName.isEmpty) {
    return "Введите Email";
  }

  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formFirstName)) {
    return "Неверный формат Email";
  }

  return null;
}

String? validateSecondName(String? formSecondName) {
  if (formSecondName == null || formSecondName.isEmpty) {
    return "Введите пароль";
  }

  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formSecondName)) {
    return "Пароль должен быть не менее 6 символов. Одна заглавная буква, число и символ(Пример: Vignesh123!)";
  }

  return null;
}


String? validateConfirmPassword(String? formConfirmPassword) {
  if (formConfirmPassword == null || formConfirmPassword.isEmpty) {
    return "Введите пароль";
  }

  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formConfirmPassword)) {
    return "Пароль должен быть не менее 6 символов. Одна заглавная буква, число и символ(Пример: Vignesh123!)";
  }

  return null;
}