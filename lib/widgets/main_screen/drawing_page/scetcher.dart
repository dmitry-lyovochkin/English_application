import 'package:english_application/widgets/main_screen/drawing_page/drawn_line.dart';
import 'package:flutter/material.dart';

class Sketcher extends CustomPainter {
  Sketcher({required this.lines});
  final List<DrawnLine> lines;

  List<Offset> offsetsList = [];
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.redAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    for (var i = 0; i < lines.length; ++i) {
      if (lines[i] == null) continue;
      for (var j = 0; j < lines[i].path.length - 1; ++j) {
        paint.color = lines[i].color;
        paint.strokeWidth = lines[i].width;
        canvas.drawLine(lines[i].path[j], lines[i].path[j + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Sketcher oldDelegate) {
    return true;
  }
}
