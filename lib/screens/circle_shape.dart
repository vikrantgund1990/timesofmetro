import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleShape extends CustomPainter{
  Paint _paint;
  double radius;

  CircleShape(MaterialColor color,this.radius) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(0.0, 0.0), radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}