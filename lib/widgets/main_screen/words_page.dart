import 'dart:ui';

import 'package:english_application/my_icons_icons.dart';
import 'package:english_application/theme.dart';
import 'package:english_application/widgets/main_screen/slider.dart';
import 'package:flutter/material.dart';
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
  double strokeWidth = 10;
  final opacity = 0.1;
  List<DrawingPoint?> drawingPoints = [];
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
          const MainPage3(),
          Padding(
            padding: const EdgeInsets.all(30),
            child: GestureDetector(
              onPanStart: (details) {
                setState(() {
                  drawingPoints.add(
                    DrawingPoint(
                      details.localPosition,
                      Paint()
                        ..color = selectedColor.withOpacity(opacity)
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
                        ..color = selectedColor.withOpacity(opacity)
                        ..isAntiAlias = true
                        ..strokeWidth = strokeWidth
                        ..strokeCap = StrokeCap.round,
                    ),
                  );
                });
              },
              onPanEnd: (details) {
                setState(() {
                  drawingPoints.add(null);
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: CustomPaint(
                  painter: _DrawingPainter(drawingPoints),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
          ),

          // Нужно будет разделить на логику и внешку
          Positioned(
              top: 5,
              left: 5,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    primary: ButtonColor.buttonColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 14,
                    ),
                  ),
                  child: Row(
                    children: const [
                      Icon(MyIcons.home, size: 27),
                    ],
                  ))),
          Positioned(
              top: 5,
              right: 5,
              child: ElevatedButton.icon(
                icon: const Icon(
                  MyIcons.tick_circle,
                  size: 27,
                ),
                label: const Text('Сохранить'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(13),
                    primary: ButtonColor.buttonColor,
                    onPrimary: Colors.white),
              )),
          Positioned(
              bottom: 15,
              left: 15,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 14,
                    ),
                    primary: Colors.white,
                    onPrimary: ButtonColor.buttonColor),
                child: const Icon(MyIcons.voice, size: 27),
              )),
          Positioned(
            bottom: 15,
            right: 15,
            child: ElevatedButton(
              onPressed: () => setState(() => drawingPoints = []),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 14,
                  ),
                  primary: Colors.white,
                  onPrimary: ButtonColor.buttonColor),
              child: const Icon(MyIcons.vector_1_, size: 27),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 85,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(231, 243, 253, 0.8),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Slider(
                    activeColor: const Color.fromRGBO(46, 124, 189, 0.5),
                    inactiveColor: const Color.fromRGBO(46, 124, 189, 0.2),
                    max: 30,
                    label: strokeWidth.round().toString(),
                    value: strokeWidth,
                    onChanged: (val) => setState(() => strokeWidth = val),
                  ),
                  ...List.generate(
                      colors.length, (index) => _useColor(colors[index])),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 14,
                        ),
                        primary: Colors.white,
                        onPrimary: ButtonColor.buttonColor),
                    child: const Icon(MyIcons.vector, size: 27),
                  ),
                ]
              ),
            ),
          )
        ]
      )
    );
  }

  Widget _useColor(Color color) {
    final isSelected = selectedColor == color;
    return GestureDetector(
        onTap: () {
          setState(() {
            selectedColor = color;
          });
        },
        child: Container(
          height: isSelected ? 35 : 25,
          width: isSelected ? 31 : 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 6,
                offset: Offset(1, 2),
              )
            ],
          ),
        ));
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

class _DrawingPainter extends CustomPainter {
  _DrawingPainter(this.drawingPoints);

  final List<DrawingPoint?> drawingPoints;

  List<Offset> offsetsList = [];

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < drawingPoints.length; i++) {
      if (drawingPoints[i] != null && drawingPoints[i + 1] != null) {
        canvas.drawLine(drawingPoints[i]!.offset, drawingPoints[i + 1]!.offset,
            drawingPoints[i]!.paint);
        offsetsList.add(drawingPoints[i]!.offset);
      } else if (drawingPoints[i] != null && drawingPoints[i + 1] == null) {
        offsetsList.clear();

        canvas.drawPoints(
            PointMode.points, offsetsList, drawingPoints[i]!.paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrawingPoint {
  DrawingPoint(this.offset, this.paint);
  Offset offset;
  Paint paint;
}
