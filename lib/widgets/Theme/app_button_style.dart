import 'package:english_application/widgets/Theme/app_color.dart';
import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static final ButtonStyle linkButton = ButtonStyle(
    // backgroundColor: MaterialStateProperty.all(AppColors.mainColorApp),
    // foregroundColor: MaterialStateProperty.all(Colors.white),
    foregroundColor: MaterialStateProperty.all(AppColors.mainColorApp),
    textStyle: MaterialStateProperty.all(
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    ),
  );
}
// зачем здесь выносить 1 баттон, когда можно вынести все 3. Рефактор потом