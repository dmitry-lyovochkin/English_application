import 'package:english_application/widgets/Theme/app_button_style.dart';
import 'package:flutter/material.dart';
import 'package:english_application/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaintBoard(),
    );
  }
}

class PaintBoard extends StatefulWidget {
  const PaintBoard({Key? key}) : super(key: key);

  @override
  _PaintBoardState createState() => _PaintBoardState();
}

class _PaintBoardState extends State<PaintBoard> {
  Color selectedColor = Colors.black;
  List<Color> colors = [
    Colors.black,
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.pink,
    Colors.purple,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
            child: Container(
                color: const Color.fromRGBO(121, 104, 216, 700),
                padding: const EdgeInsets.all(2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      colors.length, (index) => _useColor(colors[index])
                  ),
                )
            )
        )
    );
  }

  Widget _useColor(Color color) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
          height: isSelected? 35 : 25,
          width: isSelected? 35 : 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            // border: isSelected ? Border.all(
            //   color: Colors.white,
            //   width: 1,
            // ) : null
            
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
