import 'package:flutter/material.dart';

class SuggestionsPageWidget extends StatefulWidget {
  SuggestionsPageWidget({Key? key}) : super(key: key);

  @override
  _SuggestionsPageWidgetState createState() => _SuggestionsPageWidgetState();
}

class _SuggestionsPageWidgetState extends State<SuggestionsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Suggestions', style: TextStyle(fontSize: 54)))
    );
  }
}