import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do/configuration/extension/color_extension.dart';
import 'package:to_do/domain/model/note_text_model.dart';
import 'package:to_do/domain/model/position_model.dart';

class NoteTextFieldModel {
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
}

class AddNoteTextFieldNotifier extends ChangeNotifier {
  AddNoteTextFieldNotifier();

  final _textController =
      StreamController<List<NoteTextFieldModel>>.broadcast();
  List<NoteTextFieldModel> _noteTextFieldModelList = [];

  List<NoteTextFieldModel> get noteTextFieldModel => _noteTextFieldModelList;

  set noteTextFieldModel(List<NoteTextFieldModel> value) {
    _noteTextFieldModelList = value;
    notifyListeners();
  }

  int currentTextField = 0;

  Stream<List<NoteTextFieldModel>> get textController => _textController.stream;

  Future<void> increaseSize({required int index}) async {
    if (index < 0 || index >= _noteTextFieldModelList.length) {
      throw IndexError.withLength(index, _noteTextFieldModelList.length);
    }

    final currentModel = _noteTextFieldModelList[index];
    final currentFontSize = currentModel.textStyle.fontSize ?? 8;

    _noteTextFieldModelList[index] = currentModel.copyWith(
      textStyle: currentModel.textStyle.copyWith(
        fontSize: currentFontSize + 1,
      ),
    );
    _textController.add(List.from(_noteTextFieldModelList));
    notifyListeners();
  }

  Future<void> decreaseSize({required int index}) async {
    if (index < 0 || index >= _noteTextFieldModelList.length) {
      throw IndexError.withLength(index, _noteTextFieldModelList.length);
    }

    final currentModel = _noteTextFieldModelList[index];
    final currentFontSize = currentModel.textStyle.fontSize ?? 8;

    _noteTextFieldModelList[index] = currentModel.copyWith(
      textStyle: currentModel.textStyle.copyWith(
        fontSize: currentFontSize - 1,
      ),
    );
    _textController.add(List.from(_noteTextFieldModelList));

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
    _textController.add(_noteTextFieldModelList);
  }

  void updateTextPosition(Offset position,
      {required int updatedId, required double currentScrollOffset}) {
    final adjustedPosition = Offset(
      position.dx,
      position.dy + currentScrollOffset,
    );
    _noteTextFieldModelList[updatedId] =
        _noteTextFieldModelList[updatedId].copyWith(position: adjustedPosition);
    _textController.add(List.from(_noteTextFieldModelList));
  }

  Future<int> addNewTextField(Offset position) async {
    if (_noteTextFieldModelList.isNotEmpty &&
        _noteTextFieldModelList.last.textController.text.isEmpty) {
      _noteTextFieldModelList.removeLast();
    }
    _noteTextFieldModelList.add(NoteTextFieldModel.newValue(position));
    _textController.add(List.from(_noteTextFieldModelList));
    return _noteTextFieldModelList.indexOf(_noteTextFieldModelList.last);
  }

  Future<int> onTapUp(TapUpDetails? details,
      {required double currentScrollOffset}) async {
    if (details == null) return 0;

    final adjustedPosition = Offset(
      details.localPosition.dx,
      details.localPosition.dy + currentScrollOffset,
    );
    final index = await addNewTextField(adjustedPosition);
    return index;
  }

  void clearData() {
    _noteTextFieldModelList.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _textController.close();
  }
}
