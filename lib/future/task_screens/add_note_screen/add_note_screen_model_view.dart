import 'dart:developer';

import 'package:flutter/material.dart';

class AddNoteScreenModelView extends ChangeNotifier {
  List<Offset> positions = [];
  List<TextEditingController> controllers = [];
  final ScrollController scrollController = ScrollController();

  void onTapUp(TapUpDetails? details) {
    if (details == null) return;

    final scrollOffset = scrollController.offset;

    // Вычисляем координаты с учетом прокрутки
    final adjustedPosition = Offset(
      details.localPosition.dx,
      details.localPosition.dy + scrollOffset,
    );
    log('onTapUp');

    positions.add(adjustedPosition);
    controllers.add(TextEditingController());
    notifyListeners();
  }

  void onCloseScreen() {
    positions.clear();
    controllers.clear();
  }
}
