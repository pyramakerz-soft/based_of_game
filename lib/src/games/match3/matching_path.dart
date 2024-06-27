import 'package:flutter/material.dart';

import '../../core/phonetics_color.dart';

class MatchingPainter2 extends CustomPainter {
  final List<List<Offset?>> firstPosition;

  MatchingPainter2(this.firstPosition);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < firstPosition.length; i++) {
      double width = 20;
      double height = 20;
      List<Offset?> point = firstPosition[i];
      Paint userPainting = Paint()
        ..style = PaintingStyle.fill
        ..color = AppColorPhonetics.lightBlueColor4;
      for (int j = 0; j < point.length; j++) {
        if (point[j] != null) {
          canvas.drawOval(
            Rect.fromCenter(center: point[j]!, width: width, height: height),
            userPainting,
          );
          // canvas.restore();
        }
      }
    }
  }
  // if (firstPosition != null) {
  //   final paint = Paint()
  //     ..color = Colors.red
  //     ..strokeWidth = 2.0
  //     ..strokeCap = StrokeCap.round;
  //
  //   canvas.drawLine(firstPosition!, secondPosition!, paint);
  // }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
