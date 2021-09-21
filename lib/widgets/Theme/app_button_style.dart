import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static final ButtonStyle linkButton = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Color.fromRGBO(121, 104, 216, 1)),
    textStyle: MaterialStateProperty.all(
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    ),
  );
}
// зачем здесь выносить 1 баттон, когда можно вынести все 3. Рефактор потом