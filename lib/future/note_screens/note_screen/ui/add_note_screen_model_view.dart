// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:to_do/future/task_screens/add_note_screen/screen_notifiers/add_note_text_field_notifier.dart';
// import 'package:to_do/future/task_screens/add_note_screen/screen_notifiers/draw_note_notifier.dart';

// class AddNoteScreenModelView extends ChangeNotifier {
//   late final DrawNoteNotifier drawNoteNotifier =
//       DrawNoteNotifier(scrollController: scrollController);
//   late final AddNoteTextFieldNotifier addNoteTextFieldNotifier =
//       AddNoteTextFieldNotifier(scrollController: scrollController);

//   final ScrollController scrollController = ScrollController();

//   bool _isFavor = false;
//   bool get isFavor => _isFavor;

//   bool _isChoisePencil = false;
//   bool get isChoisePencil => _isChoisePencil;

//   set isChoisePencil(bool value) {
//     _isChoisePencil = value;
//     if (_isChoisePencil) {}
//     notifyListeners();
//   }

//   set isFavor(bool value) {
//     _isFavor = value;
//     notifyListeners();
//   }

//   int currentTextField = 0;

//   Future<void> onPanUpdate(DragUpdateDetails details) async {
//     await drawNoteNotifier.onPanUpdate(details);
//     notifyListeners();
//   }

//   Future<void> finishLine() async {
//     drawNoteNotifier.finishLine();
//   }

//   Future<void> updateTextPosition(Offset position,
//       {required int updatedId}) async {
//     addNoteTextFieldNotifier.updateTextPosition(position, updatedId: updatedId);
//     notifyListeners();
//   }

//   Future<void> onTapUp(TapUpDetails details) async {
//     await addNoteTextFieldNotifier.onTapUp(details);
//     notifyListeners();
//   }
// }
