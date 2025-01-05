
import 'package:to_do/data/drift/drift_db.dart';
import 'package:to_do/domain/model/sub_note_model.dart';

class SubNoteDriftProvider  {
  final AppDatabase appDatabase;

  SubNoteDriftProvider({required this.appDatabase});
  Future<int?> insertNote(SubNoteModel subnote) async {
    try {
      final id = await appDatabase
          .into(appDatabase.subNotes)
          .insert(SubNoteModel.toCompanion(subnote));
      return id;
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
    return null;
  }

  Future<SubNoteModel?> readNote({required int id}) async {
    try {
      final note = await (appDatabase.select(appDatabase.subNotes)..where((tbl) => tbl.id.equals(id)))
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
      final listNotes = await appDatabase.select(appDatabase.subNotes).get();
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
      await (appDatabase.delete(appDatabase.subNotes)..where((tbl) => tbl.id.equals(id))).go();
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
  }

  Future<void> deleteNotes() async {
    try {
      await appDatabase.delete(appDatabase.subNotes).go();
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
  }

  Future<SubNoteModel?> updateNote(SubNoteModel subNote) async {
    try {
      await (appDatabase.update(appDatabase.subNotes)..where((tbl) => tbl.id.equals(subNote.id)))
          .write(SubNoteModel.toCompanion(subNote));
    } on Exception catch (e) {
      logError(e, 'insertNote');
    }
    return null;
  }
}
