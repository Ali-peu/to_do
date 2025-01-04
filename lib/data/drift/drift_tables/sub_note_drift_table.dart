
import 'package:to_do/data/drift/const_drift_instanse.dart';
import 'package:to_do/data/drift/drift_db.dart';
import 'package:to_do/domain/model/sub_note_model.dart';

class SubNoteDriftProvider extends AppDatabase {
  Future<int?> insertNote(SubNoteModel subnote) async {
    try {
      final id = await database
          .into(subNotes)
          .insert(SubNoteModel.toCompanion(subnote));
      return id;
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
    return null;
  }

  Future<SubNoteModel?> readNote({required int id}) async {
    try {
      final note = await (select(subNotes)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();
      if (note != null) {
        return SubNoteModel.fromCompanion(note);
      }
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
    return null;
  }

  Future<List<SubNoteModel>?> readAllNote() async {
    try {
      final listNotes = await select(subNotes).get();
      if (listNotes.isNotEmpty) {
        return listNotes.map(SubNoteModel.fromCompanion).toList();
      }
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
    return null;
  }

  Future<void> deleteNote({required int id}) async {
    try {
      await (delete(subNotes)..where((tbl) => tbl.id.equals(id))).go();
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
  }

  Future<void> deleteNotes() async {
    try {
      await delete(subNotes).go();
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
  }

  Future<SubNoteModel?> updateNote(SubNoteModel subNote) async {
    try {
      await (update(subNotes)..where((tbl) => tbl.id.equals(subNote.id)))
          .write(SubNoteModel.toCompanion(subNote));
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
    return null;
  }
}
