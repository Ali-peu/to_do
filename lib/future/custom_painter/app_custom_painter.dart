import 'package:flutter/material.dart';

class AppCustomPainter extends CustomPainter {
  final List<List<Offset?>> lines; // Список всех линий
  final List<Paint> paints; // Список параметров для каждой линии

  AppCustomPainter(this.lines, this.paints);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      final paint = paints[i];

      Offset? previousPoint;

      for (final point in line) {
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
    return true; // Перерисовываем, если данные изменились
  }
}
