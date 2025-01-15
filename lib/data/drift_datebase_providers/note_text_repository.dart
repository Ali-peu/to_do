import 'package:flutter/material.dart';
import 'package:to_do/configuration/extension/color_extension.dart';
import 'package:to_do/data/drift/drift_tables/note_text_drift_table.dart';
import 'package:to_do/domain/model/note_text_model.dart';
import 'package:to_do/future/note_screens/note_screen/domain/add_note_text_field_notifier.dart';

class NoteTextRepository {
  final NoteTextDriftTable noteTextDriftTable;

  NoteTextRepository({required this.noteTextDriftTable});

  Future<int?> saveNoteTexts(
      {required NoteTextFieldModel noteTextFieldModel,
      required int noteId}) async {
    final id = await noteTextDriftTable.saveNoteTexts(NoteTextModel(
        id: 0,
        text: noteTextFieldModel.textController.text,
        noteId: noteId,
        weightValue: noteTextFieldModel.textStyle.fontWeight?.value,
        colorHex:
            (noteTextFieldModel.textStyle.color ?? Colors.black).toHexString(),
        isCursiv: false,
        textSize: noteTextFieldModel.textStyle.fontSize));
    return id;
  }

  Future<List<NoteTextModel>> getNoteTexts({required int noteId}) async {
    final list = await noteTextDriftTable.getSaveNoteTexts(noteId);
    return list;
  }
}
