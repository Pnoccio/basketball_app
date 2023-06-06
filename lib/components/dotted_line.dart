import 'package:flutter/material.dart';

class DottedLine {
  Paint? _paint;

  DottedLine() {
    _paint = Paint();
    _paint?.color = Colors.black;
    _paint?.strokeWidth = 2;
    _paint?.strokeCap = StrokeCap.square;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -300; i < 300; i = i + 15) {
      if (i % 3 == 0) {
        canvas.drawLine(Offset(i, 0.0), Offset(i + 10, 0.0), _paint!);
      }
    }

    @override
    bool shouldREpaint(CustomPainter oldDelegate) {
      return false;
    }
  }
}
