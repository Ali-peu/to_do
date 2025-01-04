import 'dart:async';
import 'package:flutter/material.dart';

class DrawNoteNotifier {
  final positionsStreamController = StreamController<List<List<Offset>>>.broadcast();

  List<List<Offset>> points = [];
  List<Offset> currentLine = [];

  DrawNoteNotifier();

  Future<void> onPanUpdate(DragUpdateDetails details,{required double currentScrollOffset}) async {

    final localPosition = Offset(
      details.localPosition.dx,
      details.localPosition.dy + currentScrollOffset,
    );

    addPoint(localPosition);
  }

  void addPoint(Offset point) {
    currentLine.add(point);
    points.add(List.from(currentLine));

    // Отправляем полное состояние
    positionsStreamController.add(List.from(points));
  }

  void finishLine() {
    currentLine.clear();
    // Отправляем обновление
    positionsStreamController.add(List.from(points));
  }

  void clearDrawing() {
    points.clear();
    currentLine.clear();
    // Отправляем обновление
    positionsStreamController.add(List.from(points));
  }

  void closeStreamController() {
    positionsStreamController.close();
  }
}
