import 'package:flutter/material.dart';
import 'package:english_application/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter/services.dart';

class WordsPageWidget extends StatefulWidget {
  const WordsPageWidget({Key? key}) : super(key: key);

  
  @override
  _WordsPageWidgetState createState() => _WordsPageWidgetState();
  
}

class _WordsPageWidgetState extends State<WordsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Tenglish1'),
      ),
      body: const Center(
        child: Text(
          'Words', 
          style: TextStyle(
            fontSize: 14)),
          
       ),
    );
  }
  @override
    void initState(){
      super.initState();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
  }
  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}

