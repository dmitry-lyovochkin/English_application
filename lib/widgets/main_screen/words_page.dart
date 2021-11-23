import 'dart:ui';

import 'package:english_application/theme.dart';
import 'package:english_application/widgets/main_screen/slider.dart';
import 'package:english_application/widgets/main_screen/suggestion_page/suggestions_page.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
                icon: const Icon(Icons.arrow_back),
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
                    ElevatedButton.icon(
                      onPressed: () => setState(() => drawingPoints = []),
                      icon: const Icon(Icons.cancel),
                      label: const Text('Clear Board'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(121, 104, 216, 100)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8)),
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
  DrawingPoint(
    this.offset, 
    this.paint
  );
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


final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fdread.jpg?alt=media&token=449e01fd-c51a-47e9-b45e-878ff4b08588',
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fdrought.jpg?alt=media&token=5da7e5cc-ec0a-4eb0-9386-caaa0ffdeada',
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Ffine.jpg?alt=media&token=280debb3-f6c1-4c9b-aaa3-1bb4eb0d6a4e',
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fgoal.jpg?alt=media&token=2677924e-0296-4cb2-8938-ef6f16bacafd',
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fgrab.jpg?alt=media&token=f5ed0e6a-ea8f-4699-8c2e-502d804526b5',
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Flook%20after.jpg?alt=media&token=1e57f321-1837-4a8e-9d99-936009365781',
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fmug.jpg?alt=media&token=4a265f7c-1b31-40f3-a729-977b1737ce6b',
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Frule.jpg?alt=media&token=425e94f4-912b-409a-9e98-965c760c0656',
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fsloppy.jpg?alt=media&token=a6151045-1655-4a89-8e7c-20a608cfc886',
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fwall.jpg?alt=media&token=fa41d6f8-3eea-4137-9aae-da9646a79656',
];

void main() => runApp(const CarouselDemo());

final themeMode = ValueNotifier(2);

class CarouselDemo extends StatelessWidget {
  const CarouselDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          // initialRoute: '/fullscreen',
          // darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          home: const FullscreenSliderDemo(),
          // routes: {
          //   '/fullscreen': (ctx) => const FullscreenSliderDemo(),
          // },
        );
      },
      valueListenable: themeMode,
    );
  }
}

class DemoItem extends StatelessWidget {
  const DemoItem(
    this.title, this.route, 
    {Key? key}) : super(key: key);
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}



class FullscreenSliderDemo extends StatelessWidget {
  const FullscreenSliderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Fullscreen sliding carousel demo')),
      body: Builder(
        builder: (context) {
          // final height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: 200,
              viewportFraction: 1,
              // autoPlay: false,
            ),
            items: imgList
                .map((item) => Center(
                    child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  height: 500,
                  // width: 600,
                )))
                .toList(),
          );
        },
      ),
    );
  }
}


