import 'dart:ui';

import 'package:english_application/theme.dart';
import 'package:english_application/widgets/main_screen/slider.dart';
import 'package:english_application/widgets/main_screen/suggestion_page/suggestions_page.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';


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
          const CarouselDemo1(),
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
              onPanEnd: (details) {
                setState(() {
                  drawingPoints.add(null);
                });
              },
              child: CustomPaint(
                painter: _DrawingPainter(drawingPoints),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            // Нужно будет разделить на логику и внешку
            Positioned(
              top: 30,
              left: 15,
              child: IconButton(
                color: AppColors.mainColorApp,
                key: const Key('homePage_logout_iconButton'),
                icon: const Icon(Icons.reply),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
                top: 30,
                right: 30,
                child: Row(
                  children: [
                    Slider(
                      activeColor: const Color.fromRGBO(121, 104, 216, 100),
                      max: 40,
                      label: strokeWidth.round().toString(),
                      value: strokeWidth,
                      onChanged: (val) => setState(() => strokeWidth = val),
                    ),
                    TextButton.icon(
                      onPressed: () => setState(() => drawingPoints = []),
                      icon: const Icon(Icons.cancel),
                      label: const Text('Clear Board'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(255, 255, 255, 255)),
                        foregroundColor:
                            MaterialStateProperty.all(const Color.fromRGBO(121, 104, 216, 100)),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5)),
                      ),
                    ),
                  ],
                )),
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
    final isSelected = selectedColor == color;
    return GestureDetector(
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
                blurRadius: 3,
                offset: const Offset(1, 2),
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

// firebase. Потом разделить на логику

// firebase_storage.FirebaseStorage storage =
//   firebase_storage.FirebaseStorage.instance;

// Future<void> listExample() async {
//   final result = await firebase_storage
//       .FirebaseStorage.instance
//       .ref()
//       .list(const firebase_storage.ListOptions(maxResults: 10));
//   // ...
// }

