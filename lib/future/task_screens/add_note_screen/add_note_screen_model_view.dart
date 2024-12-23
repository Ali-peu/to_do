import 'dart:developer';

import 'package:flutter/material.dart';

class AddNoteScreenModelView extends ChangeNotifier {
  List<Offset> positions = [];
  List<TextEditingController> controllers = [];
  final ScrollController scrollController = ScrollController();

  void updateTextPosition(Offset position, {required int updatedId}) {
    positions[updatedId] = position;
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
