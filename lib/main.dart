import 'package:flutter/material.dart';
import 'package:english_application/widgets/authorization/auth_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English words', 
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(121, 104, 216, 1)), /* 121, 104, 216, */ /* 190, 179, 239, */ /* 252, 200, 192, */ /* 173, 221, 254, */ /* 253, 160, 34, 1 */
      ),
      home: AuthWidget(),
    );
  }
}