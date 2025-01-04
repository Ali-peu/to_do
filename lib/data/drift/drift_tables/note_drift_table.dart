import 'package:to_do/data/drift/const_drift_instanse.dart';
import 'package:to_do/data/drift/drift_db.dart';
import 'package:to_do/domain/model/note.dart';

class NoteDriftTable extends AppDatabase {
  Future<int?> insertNote(NoteModel note) async {
    try {
      final id = await database.into(notes).insert(NoteModel.toCompanion(note));
      return id;
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
    return null;
  }

  Future<NoteModel?> readNote({required int id}) async {
    try {
      final note = await (select(notes)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();
      if (note != null) {
        return NoteModel.fromCompanion(note);
      }
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
    return null;
  }

  Future<List<NoteModel>?> readAllNote() async {
    try {
      final listNotes = await select(notes).get();
      if (listNotes.isNotEmpty) {
        return listNotes.map(NoteModel.fromCompanion).toList();
        // return list;
        // NoteModel.fromCompanion(note);
      }
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
    return null;
  }

  Future<void> deleteNote({required int id}) async {
    try {
      await (delete(notes)..where((tbl) => tbl.id.equals(id))).go();
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
  }

  Future<void> deleteNotes() async {
    try {
      await delete(notes).go();
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
  }

  Future<NoteModel?> updateNote(NoteModel note) async {
    try {
      await (update(notes)..where((tbl) => tbl.id.equals(note.id)))
          .write(NoteModel.toCompanion(note));
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
    return null;
  }
}
