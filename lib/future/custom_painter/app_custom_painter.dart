import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:to_do/future/custom_painter/drawing_points_model.dart';

class DrawingPainter extends CustomPainter {
  DrawingPainter({required this.pointsList});
  List<DrawingPoints?> pointsList;
  List<Offset> offsetPoints = [];
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length - 1; i++) {
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        canvas.drawLine(pointsList[i]?.points ?? Offset.zero, pointsList[i + 1]?.points ?? Offset.zero,
            pointsList[i]?.paint ?? Paint());
      } else if (pointsList[i] != null && pointsList[i + 1] == null) {
        offsetPoints..clear()
        ..add(pointsList[i]?.points ?? Offset.zero)
        ..add(Offset(
            (pointsList[i]?.points.dx  ?? Offset.zero.dx)+ 0.1, (pointsList[i]?.points.dy  ?? Offset.zero.dy) + 0.1));
        canvas.drawPoints(PointMode.points, offsetPoints, pointsList[i]?.paint ?? Paint());
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}


enum SelectedMode { StrokeWidth, Opacity, Color }
