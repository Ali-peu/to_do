import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do/configuration/extension/color_extension.dart';
import 'package:to_do/domain/model/linear_model.dart';
import 'package:to_do/future/custom_painter/painter_controller.dart';

class DrawNoteNotifier extends ChangeNotifier {
  final positionsStreamController =
      StreamController<List<List<Offset>>>.broadcast();

  List<List<Offset>> points = [];
  List<Offset> currentLine = [];
  List<Paint> paints = [];
  final PainterController painterController;
  DrawNoteNotifier({required this.painterController});

  Color _color = Colors.black;
  Color get color => _color;

  set color(Color newColor) {
    _color = newColor;
    painterController.updateColor(newColor);
    notifyListeners();
  }

  double _strokeWidth = 2;
  double get strokeWidth => _strokeWidth;

  set strokeWidth(double value) {
    _strokeWidth = value;
    painterController.strokeWidth = value;

    notifyListeners();
  }

  Future<void> addValueForStream(List<List<Offset>> list) async {
    positionsStreamController.add(list);
  }

  Future<void> createPaints(List<LinearModel> list) async {
    paints = list
        .map((e) => Paint()
          ..color = e.colorHex.toColor()
          ..strokeWidth = e.strokeWidth
          ..strokeCap = StrokeCap.round)
        .toList();
    notifyListeners();
  }

  Future<void> onPanUpdate(DragUpdateDetails details,
      {required double currentScrollOffset}) async {
    final localPosition = Offset(
      details.localPosition.dx,
      details.localPosition.dy + currentScrollOffset,
    );

    addPoint(localPosition);
  }

  void addPoint(Offset point) {
    currentLine.add(point);
    points.add(List.from(currentLine));
    paints.add(Paint()
      ..color = painterController.color ?? Colors.black
      ..strokeWidth = painterController.strokeWidth ?? 2
      ..strokeCap = painterController.strokeCap ?? StrokeCap.round);

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
