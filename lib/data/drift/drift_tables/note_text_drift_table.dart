import 'package:to_do/data/drift/drift_db.dart';
import 'package:to_do/domain/model/note_text_model.dart';

class NoteTextDriftTable   {

  final AppDatabase appDatabase;

  NoteTextDriftTable({required this.appDatabase});

  Future<int?> saveNoteTexts(NoteTextModel noteTextModel) async {
    final id = await appDatabase
        .into(appDatabase.noteTexts)
        .insert(NoteTextModel.toCompanion(noteTextModel));

    return id;
  }

  Future<List<NoteTextModel>> getSaveNoteTexts(int noteId) async {
    final list = await (appDatabase.select(appDatabase.noteTexts)
          ..where((tbl) => tbl.noteId.equals(noteId)))
        .get();

    return list.map(NoteTextModel.fromComponion).toList();
  }
}
