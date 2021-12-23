import 'dart:async';

import 'package:english_application/my_icons_icons.dart';
import 'package:english_application/theme.dart';
import 'package:english_application/widgets/main_screen/drawing_page/buttons.dart';
import 'package:english_application/widgets/main_screen/drawing_page/drawn_line.dart';
import 'package:english_application/widgets/main_screen/drawing_page/scetcher.dart';
import 'package:english_application/widgets/main_screen/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  final GlobalKey _globalKey = GlobalKey();
  List<DrawnLine> lines = <DrawnLine>[];
  DrawnLine? line;
  Color selectedColor = Colors.black;
  double selectedWidth = 10;

  StreamController<List<DrawnLine>> linesStreamController =
      StreamController<List<DrawnLine>>.broadcast();
  StreamController<DrawnLine> currentLineStreamController =
      StreamController<DrawnLine>.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow[50],
      body: Stack(
        children: [
          // bottomCont(),
          const MainPage3(),
          buildAllPaths(context),
          buildCurrentPath(context),
          // buildStrokeToolbar(),
          buildColorToolbar(),
          const ButtonsDraw(),
          slider(),
        ],
      ),
    );
  }

  Widget buildCurrentPath(BuildContext context) {
    return GestureDetector(
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        child: RepaintBoundary(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(4),
                color: Colors.transparent,
                alignment: Alignment.topLeft,
                child: StreamBuilder<DrawnLine>(
                    stream: currentLineStreamController.stream,
                    builder: (context, snapshot) {
                      if (line != null) {
                        return CustomPaint(
                          painter: Sketcher(
                            lines: [line!],
                          ),
                        );
                      } else {
                        return const CustomPaint();
                      }
                    }))));
  }

  Widget buildAllPaths(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        padding: const EdgeInsets.all(4),
        alignment: Alignment.topLeft,
        child: StreamBuilder<List<DrawnLine>>(
          stream: linesStreamController.stream,
          builder: (context, snapshot) {
            return CustomPaint(
              painter: Sketcher(
                lines: lines,
              ),
            );
          },
        ),
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);
    line = DrawnLine([point], selectedColor, selectedWidth);
  }

  void onPanUpdate(DragUpdateDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);

    final path = List<Offset>.from(line!.path)..add(point);
    line = DrawnLine(path, selectedColor, selectedWidth);
    currentLineStreamController.add(line!);
  }

  void onPanEnd(DragEndDetails details) {
    lines = List.from(lines)..add(line!);
    linesStreamController.add(lines);
  }

  Widget buildColorToolbar() {
    return Positioned(
      bottom: 22,
      right: 80,
      child: SizedBox(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildColorButton(Colors.black),
            buildColorButton(Colors.green),
            buildColorButton(Colors.blue),
            buildColorButton(Colors.red),
            buildColorButton(Colors.yellow),
            buildColorButton(Colors.pink),
            buildColorButton(Colors.purple),
            buildColorButton(Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget buildColorButton(Color color) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: color,
      onPressed: () {
        setState(() {
          selectedColor = color;
        });
      },
    );
  }

  // Widget bottomCont() {
  //   Positioned(
  //     bottom: 15,
  //     right: 85,
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 22),
  //       decoration: const BoxDecoration(
  //           color: Color.fromRGBO(231, 243, 253, 0.8),
  //           borderRadius: BorderRadius.all(Radius.circular(16))),
  //       child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
  //         Slider(
  //           activeColor: const Color.fromRGBO(46, 124, 189, 0.5),
  //           inactiveColor: const Color.fromRGBO(46, 124, 189, 0.2),
  //           max: 30,
  //           label: selectedWidth.round().toString(),
  //           value: selectedWidth,
  //           onChanged: (val) => setState(() => selectedWidth = val),
  //         ),
  //       ]),
  //     ),
  //   );
  // }

  Widget slider() {
    return Positioned(
      bottom: 15,
      left: 70,
      child: Slider(
        activeColor: const Color.fromRGBO(46, 124, 189, 0.5),
        inactiveColor: const Color.fromRGBO(46, 124, 189, 0.2),
        min: 3,
        max: 30,
        label: selectedWidth.round().toString(),
        value: selectedWidth,
        onChanged: (val) => setState(() => selectedWidth = val),
      ),
    );
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
