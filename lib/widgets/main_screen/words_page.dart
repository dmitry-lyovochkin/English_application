import 'package:flutter/material.dart';

class WordsPageWidget extends StatefulWidget {
  WordsPageWidget({Key? key}) : super(key: key);

  @override
  _WordsPageWidgetState createState() => _WordsPageWidgetState();
}

class _WordsPageWidgetState extends State<WordsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Words', style: TextStyle(fontSize: 54))
       )
    );
  }
}