import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  primaryColorDark: const Color(0xFF0097A7),
  primaryColorLight: const Color(0xFFB2EBF2),
  primaryColor: const Color(0xFF00BCD4),
  colorScheme: const ColorScheme.light(secondary: Color(0xFF009688)),
  scaffoldBackgroundColor: const Color(0xFFE3F2FD),  /*0xFFE1F5FE*/ /* 0xFFE8F5E9 */ /* 0xFFE0F2F1 */
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  
);

abstract class AppColors {
  static const mainColorApp = Color.fromRGBO(121, 104, 216, 1); /* 121, 104, 216, */ /* 190, 179, 239, */ /* 252, 200, 192, */ /* 173, 221, 254, */ /* 253, 160, 34, 1 */
}
// цвета кнопок сюда перекинуть

abstract class ButtonColor {
  static const buttonColor = Color.fromRGBO(46, 124, 189, 1); 
}