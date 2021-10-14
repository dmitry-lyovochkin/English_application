import 'package:flutter/material.dart';

class RepeatPageWidget extends StatefulWidget {
  RepeatPageWidget({Key key}) : super(key: key);

  @override
  _RepeatPageWidgetState createState() => _RepeatPageWidgetState();
}

class _RepeatPageWidgetState extends State<RepeatPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Repeat', style: TextStyle(fontSize: 54)))
    );
  }
}