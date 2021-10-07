import 'package:flutter/material.dart';

class PaintScreenWidget extends StatefulWidget {
   PaintScreenWidget({Key? key}) : super(key: key);

  @override
  _PaintScreenWidgetState createState() => _PaintScreenWidgetState();
}



class _PaintScreenWidgetState extends State<PaintScreenWidget> {
  @override
  Widget build(BuildContext context) {
      Navigator.of(context).pushReplacementNamed('/auth');
    return Scaffold(
      appBar: AppBar(
        title: Text('PaintScreen'),
      ),
    );
  }

}