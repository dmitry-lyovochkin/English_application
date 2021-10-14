import 'package:english_application/widgets/main_screen/drawing_page/drawing_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawing App',
      home: DrawingPage(),
    );
  }
}