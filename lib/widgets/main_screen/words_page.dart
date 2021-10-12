import 'dart:ui';

import 'package:english_application/widgets/Theme/app_button_style.dart';
import 'package:flutter/material.dart';
import 'package:english_application/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  double strokeWidth = 5;
  List<DrawingPoint> drawingPoints = [];
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
        body: Stack(
          children: [
            GestureDetector(
              onPanStart: (details) {
                setState(() {
                  drawingPoints.add(
                    DrawingPoint(
                      details.localPosition,
                      Paint()
                        ..color = selectedColor
                        ..isAntiAlias = true
                        ..strokeWidth = strokeWidth
                        ..strokeCap = StrokeCap.round,
                    ),
                  );
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  drawingPoints.add(
                    DrawingPoint(
                      details.localPosition,
                      Paint()
                        ..color = selectedColor
                        ..isAntiAlias = true
                        ..strokeWidth = strokeWidth
                        ..strokeCap = StrokeCap.round,
                    ),
                  );
                });
              },
              // onPanEnd: (details) {
              //   setState(() {
              //     drawingPoints.add(null);
              //   });
              // },
              child: CustomPaint(
                painter: _DrawingPainter(drawingPoints),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Positioned( 
              top: 40,
              right: 30,
              child: Row(
                children: [
                  Slider(
                    min: 0,
                    max: 40,
                    value: strokeWidth, 
                    onChanged: (val) => setState(() => strokeWidth = val),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => setState(() => drawingPoints = []), 
                    icon: Icon(Icons.clear), 
                    label: Text("Clear Board"),
                  )
                ],
              )
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                color: const Color.fromRGBO(121, 104, 216, 700),
                padding: const EdgeInsets.all(2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      colors.length, (index) => _useColor(colors[index])),
                ))));
  }

  Widget _useColor(Color color) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
        /* по доке */
        onTap: () {
          setState(() {
            selectedColor = color;
          });
        },
        child: Container(
          /* сделать больше зону нажатия на цвет */
          height: isSelected ? 35 : 25,
          width: isSelected ? 35 : 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.9),
                // spreadRadius: 10,
                blurRadius: 3,
                offset: const Offset(1, 2),
              )
            ],
          ),
        ));
  }

  // поворот экрана
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

class _DrawingPainter extends CustomPainter {
  final List<DrawingPoint> drawingPoints;

  _DrawingPainter(this.drawingPoints);

  List<Offset> offsetList = [];

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPoints.length; i++) {
      if (drawingPoints[i] != null && drawingPoints[i + 1] != null) {
        canvas.drawLine(drawingPoints[i].offset, drawingPoints[i + 1].offset,
            drawingPoints[i].paint);
      } else if (drawingPoints[i] != null && drawingPoints[i + 1] == null) {
        offsetList.clear();
        offsetList.add(drawingPoints[i].offset);

        canvas.drawPoints(PointMode.points, offsetList, drawingPoints[i].paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldFelegate) => true;
}

class DrawingPoint {
  Offset offset;
  Paint paint;

  DrawingPoint(this.offset, this.paint);
}
