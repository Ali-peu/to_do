import 'package:flutter/material.dart';

class AppCustomPainter extends CustomPainter {
  final List<List<Offset?>> lines;  // Список всех линий

  AppCustomPainter(this.lines);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    for (var line in lines) {
      Offset? previousPoint;
      
      for (var point in line) {
        if (point != null) {
          if (previousPoint != null) {
            canvas.drawLine(previousPoint, point, paint);
          }
          previousPoint = point;
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
