import 'package:english_application/widgets/auth_firebase/registration_screen.dart';

// validation
String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return "Введите Email";
  }

  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
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
    return "Введите Имя";
  }

  String pattern = '[a-zA-Z]';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formFirstName)) {
    return "Некорректное Имя";
  }

  // не знаю нужно ли давать здесь на меньше 3 символов. Есть русские имена вроде Ян

  return null;
}

String? validateSecondName(String? formSecondName) {
  if (formSecondName == null || formSecondName.isEmpty) {
    return "Введите Фамилию";
  }

  String pattern = '[a-zA-Z]';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formSecondName)) {
    return "Некорректная Фамилия";
  }

  return null;
}

// r'^
//   (?=.*[A-Z])       // should contain at least one upper case
//   (?=.*[a-z])       // should contain at least one lower case
//   (?=.*?[0-9])      // should contain at least one digit
//   (?=.*?[!@#\$&*~]) // should contain at least one Special character
//   .{8,}             // Must be at least 8 characters in length
// $
