import 'package:flutter/material.dart';

class PainterController extends ChangeNotifier {
  double? strokeWidth;
  Color? color;
  StrokeCap? strokeCap;

  PainterController({
     this.strokeWidth,
     this.color,
     this.strokeCap,
  });

  // Обновление свойств с уведомлением
  void updateStrokeWidth(double newWidth) {
    strokeWidth = newWidth;
    notifyListeners();
  }

  void updateColor(Color newColor) {
    color = newColor;
    notifyListeners();
  }

  void updateStrokeCap(StrokeCap newCap) {
    strokeCap = newCap;
    notifyListeners();
  }

  // Создание нового экземпляра контроллера
  PainterController copyWith({
    double? strokeWidth,
    Color? color,
    StrokeCap? strokeCap,
  }) {
    return PainterController(
      strokeWidth: strokeWidth ?? this.strokeWidth,
      color: color ?? this.color,
      strokeCap: strokeCap ?? this.strokeCap,
    );
  }
}
