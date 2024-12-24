import 'dart:developer';

import 'package:flutter/material.dart';

class AddNoteScreenModelView extends ChangeNotifier {
  List<Offset> positions = [];

  List<List<Offset>> points = [];
  List<Offset?> currentLine = [];

  List<TextEditingController> controllers = [];
  final ScrollController scrollController = ScrollController();

  bool _isFavor = false;
  bool get isFavor => _isFavor;

  bool _isChoisePencil = false;
  bool get isChoisePencil => _isChoisePencil;

  set isChoisePencil(bool value) {
    _isChoisePencil = value;
    if(_isChoisePencil){
    }
    notifyListeners();
  }

  set isFavor(bool value) {
    _isFavor = value;
    notifyListeners();
  }

  void addPoint(Offset? point) {
    if (point == null) return;
    currentLine.add(point);
    notifyListeners(); // Уведомляем о необходимости перерисовки
  }

  void finishLine() {
    // Завершаем текущую линию и начинаем новую
    points.add(List.from(currentLine)); // Сохраняем текущую линию
    currentLine.clear(); // Очищаем текущую линию
    notifyListeners();
  }

  void clearDrawing() {
    points.clear();
    notifyListeners();
  }

  int currentTextField = 0;
  void moveToNextTextField() {
    if (positions.isNotEmpty) {
      currentTextField = (currentTextField + 1) % positions.length;

      // Анимация к следующей позиции
      scrollController.animateTo(
        positions[currentTextField].dy,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void updateTextPosition(Offset position, {required int updatedId}) {
    final scrollOffset = scrollController.offset;

    final adjustedPosition = Offset(
      position.dx,
      position.dy + scrollOffset,
    );
    positions[updatedId] = adjustedPosition;
    notifyListeners();
  }

  Future<void> onTapUp(TapUpDetails? details) async {
    if (details == null) return;

    final scrollOffset = scrollController.offset;

    // Вычисляем координаты с учетом прокрутки
    final adjustedPosition = Offset(
      details.localPosition.dx,
      details.localPosition.dy + scrollOffset,
    );
    log('onTapUp');

    await addNewTextField(adjustedPosition);
    notifyListeners();
  }

  Future<void> addNewTextField(Offset position) async {
    if (controllers.isNotEmpty && controllers.last.text.isEmpty) {
      controllers.removeLast();
      positions
        ..removeLast()
        ..add(position);
      controllers.add(TextEditingController());
    } else {
      positions.add(position);
      controllers.add(TextEditingController());
    }
  }

  void onCloseScreen() {
    positions.clear();
    controllers.clear();
    notifyListeners();
  }
}
