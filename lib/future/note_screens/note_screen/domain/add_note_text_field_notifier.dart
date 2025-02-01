import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:to_do/configuration/extension/color_extension.dart';
import 'package:to_do/domain/model/note_text_model.dart';
import 'package:to_do/domain/model/position_model.dart';

class NoteTextFieldModel extends Equatable {
  final Offset position;
  final TextEditingController textController;
  final TextStyle textStyle;
  const NoteTextFieldModel(
      {required this.position,
      required this.textController,
      required this.textStyle});

  NoteTextFieldModel copyWith(
      {Offset? position,
      TextEditingController? textController,
      TextStyle? textStyle}) {
    return NoteTextFieldModel(
        position: position ?? this.position,
        textController: textController ?? this.textController,
        textStyle: textStyle ?? this.textStyle);
  }

  NoteTextFieldModel.newValue(Offset newPosition)
      : position = newPosition,
        textController = TextEditingController(),
        textStyle = const TextStyle();

  @override
  List<Object?> get props => [position, textController.text];
}

class AddNoteTextFieldNotifier extends ChangeNotifier {
  AddNoteTextFieldNotifier();

  List<NoteTextFieldModel> _noteTextFieldModelList = [];

  List<NoteTextFieldModel> get noteTextFieldModel => _noteTextFieldModelList;

  set noteTextFieldModel(List<NoteTextFieldModel> value) {
    _noteTextFieldModelList = value;
    notifyListeners();
  }

  int currentTextField = 0;

  Future<void> increaseSize({required int index}) async {
    if (index < 0 || index >= _noteTextFieldModelList.length) {
      throw IndexError.withLength(index, _noteTextFieldModelList.length);
    }

    final currentModel = _noteTextFieldModelList[index];
    final currentFontSize = currentModel.textStyle.fontSize ?? 15;

    _noteTextFieldModelList[index] = currentModel.copyWith(
      textStyle: currentModel.textStyle.copyWith(
        fontSize: currentFontSize + 1,
      ),
    );
    notifyListeners();
  }

  Future<void> decreaseSize({required int index}) async {
    if (index < 0 || index >= _noteTextFieldModelList.length) {
      throw IndexError.withLength(index, _noteTextFieldModelList.length);
    }

    final currentModel = _noteTextFieldModelList[index];
    final currentFontSize = currentModel.textStyle.fontSize ?? 15;

    _noteTextFieldModelList[index] = currentModel.copyWith(
      textStyle: currentModel.textStyle.copyWith(
        fontSize: currentFontSize - 1,
      ),
    );

    notifyListeners();
  }

  Future<void> addTextListForStream(
      List<NoteTextModel> texts, List<PositionModel> positions) async {
    _noteTextFieldModelList = texts
        .map((e) => NoteTextFieldModel(
            textController: TextEditingController(text: e.text),
            position: positions
                .firstWhere((data) => data.parentId == e.id,
                    orElse: () => PositionModel(
                        dx: 0,
                        dy: 0,
                        id: 0,
                        parentId: 0,
                        positionType: PositionType.text.name))
                .toOffset(),
            textStyle: TextStyle(
              color: e.colorHex.toColor(),
            )))
        .toList();
    notifyListeners();
  }

  void updateTextPosition(Offset position,
      {required int updatedId, required double currentScrollOffset}) {
    final adjustedPosition = Offset(
      position.dx,
      position.dy + currentScrollOffset,
    );
    _noteTextFieldModelList[updatedId] =
        _noteTextFieldModelList[updatedId].copyWith(position: adjustedPosition);
    notifyListeners();
  }

  Future<void> addTextFieldValue(
      {required int index, required String? value}) async {
    _noteTextFieldModelList[index] = _noteTextFieldModelList[index].copyWith(
        textController: _noteTextFieldModelList[index].textController
          ..text = value ?? '');
    notifyListeners();
  }

  Future<int> addNewTextField(Offset position) async {
    if (_noteTextFieldModelList.isNotEmpty &&
        _noteTextFieldModelList.last.textController.text.isEmpty) {
      _noteTextFieldModelList.removeLast();
    }
    _noteTextFieldModelList.add(NoteTextFieldModel.newValue(position));
    return _noteTextFieldModelList.indexOf(_noteTextFieldModelList.last);
  }

  Future<int> onTapUp(
      {required double localPositionDx,
      required double localPositionDy,
      required double currentScrollOffset}) async {
    final adjustedPosition = Offset(
      localPositionDx,
      localPositionDy + currentScrollOffset,
    );
    final index = await addNewTextField(adjustedPosition);
    notifyListeners();
    return index;
  }

  void clearData() {
    _noteTextFieldModelList.clear();
  }
}
