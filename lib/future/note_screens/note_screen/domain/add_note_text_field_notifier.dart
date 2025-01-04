import 'dart:async';
import 'package:flutter/material.dart';

class AddNoteTextFieldNotifier {
  final _positionsController = StreamController<List<Offset>>.broadcast();
  final _controllersController =
      StreamController<List<TextEditingController>>.broadcast();

  List<Offset> positions = [];
  List<TextEditingController> controllers = [];

  int currentTextField = 0;

  AddNoteTextFieldNotifier();

  Stream<List<Offset>> get positionsStream => _positionsController.stream;
  Stream<List<TextEditingController>> get controllersStream =>
      _controllersController.stream;

  Future<void> addTextListForStream(List<String> texts) async {
    controllers = texts.map((e) => TextEditingController(text: e)).toList();
    _controllersController.add(controllers);
  }

  Future<void> addTextPositions(List<Offset> positionsList) async {
    positions = positionsList;
    _positionsController.add(positionsList);
  }

  // void moveToNextTextField() {
  //   if (positions.isNotEmpty) {
  //     currentTextField = (currentTextField + 1) % positions.length;

  //     // Анимация к следующей позиции
  //     scrollController.animateTo(
  //       positions[currentTextField].dy,
  //       duration: const Duration(milliseconds: 500),
  //       curve: Curves.easeInOut,
  //     );

  //     // Обновляем состояние позиций
  //     _positionsController.add(List.from(positions));
  //   }
  // }

  void updateTextPosition(Offset position,
      {required int updatedId, required double currentScrollOffset}) {
    final adjustedPosition = Offset(
      position.dx,
      position.dy + currentScrollOffset,
    );

    positions[updatedId] = adjustedPosition;
    _positionsController.add(List.from(positions));
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

    // Обновляем состояние позиций и контроллеров
    _positionsController.add(List.from(positions));
    _controllersController.add(List.from(controllers));
  }

  Future<void> onTapUp(TapUpDetails? details,
      {required double currentScrollOffset}) async {
    if (details == null) return;

    // Вычисляем координаты с учетом прокрутки
    final adjustedPosition = Offset(
      details.localPosition.dx,
      details.localPosition.dy + currentScrollOffset,
    );

    await addNewTextField(adjustedPosition);
  }

  void dispose() {
    _positionsController.close();
    _controllersController.close();
  }
}
