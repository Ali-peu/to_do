import 'package:to_do/data/drift/const_drift_instanse.dart';
import 'package:to_do/data/drift/drift_db.dart';
import 'package:to_do/domain/model/note_text_model.dart';

class NoteTextDriftTable extends AppDatabase {
  Future<int?> saveNoteTexts(NoteTextModel noteTextModel) async {
    final id = await database
        .into(noteTexts)
        .insert(NoteTextModel.toCompanion(noteTextModel));

    return id;
  }

  Future<List<NoteTextModel>> getSaveNoteTexts(int noteId) async {
    final list = await (select(noteTexts)
          ..where((tbl) => tbl.noteId.equals(noteId)))
        .get();

    return list.map(NoteTextModel.fromComponion).toList();
  }
}
