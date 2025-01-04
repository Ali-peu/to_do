import 'dart:ui';

import 'package:to_do/data/drift/drift_tables/note_linear_drift_table.dart';
import 'package:to_do/data/drift/drift_tables/note_text_drift_table.dart';
import 'package:to_do/domain/model/note_text_model.dart';

class NoteTextRepository {
  final NoteTextDriftTable noteTextDriftTable;

  NoteTextRepository({required this.noteTextDriftTable});

  Future<int?> saveNoteTexts(
      {required String text, required int noteId}) async {
    final id = await noteTextDriftTable.saveNoteTexts(NoteTextModel(
        id: 0, description: text, noteId: noteId, textStyle: 0, colorHex: '0'));
    return id;
  }

  Future<List<NoteTextModel>> getNoteTexts({required int noteId}) async {
    final list = await noteTextDriftTable.getSaveNoteTexts(noteId);
    return list;
  }
}
