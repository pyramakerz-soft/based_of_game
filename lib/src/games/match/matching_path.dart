import 'package:flutter/material.dart';

class MatchingPainter extends CustomPainter {
  final Offset? firstPosition;
  final Offset? secondPosition;

  MatchingPainter(this.firstPosition, this.secondPosition);

  @override
  void paint(Canvas canvas, Size size) {
    if (firstPosition != null && secondPosition != null) {
      final paint = Paint()
        ..color = Colors.red
        ..strokeWidth = 2.0
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(firstPosition!, secondPosition!, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
