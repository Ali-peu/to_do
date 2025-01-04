import 'dart:async';

import 'package:to_do/data/database_provider/database_provider.dart';
import 'package:to_do/data/drift/drift_tables/note_drift_table.dart';
import 'package:to_do/domain/model/note.dart';

class NoteRepository extends DatabaseProvider<NoteModel> {
  final NoteDriftTable noteDriftProvider;

  NoteRepository({required this.noteDriftProvider});

  @override
  Future<int?> createNoteForDB(NoteModel model) async {
    final id = await noteDriftProvider.insertNote(model);
    return id;
  }

  @override
  Future<void> deleteNoteFromDB({required int id}) async {
    await noteDriftProvider.deleteNote(id: id);
  }

  @override
  Future<NoteModel?> readNoteFromDB({required int id}) async {
    final note = await noteDriftProvider.readNote(id: id);
    return note;
  }

  @override
  Future<void> clearDB() async {
    // await noteDriftProvider.
    // throw UnimplementedError();
  }

  @override
  Future<NoteModel?> updateNoteInDB({required NoteModel model}) async {
    final updateNote = await noteDriftProvider.updateNote(model);

    return updateNote;
  }

  Future<void> createSubNotesModel()async{}
  
  @override
  Future<List<NoteModel>?> readAllNoteFromDB()async {
   final list = await noteDriftProvider.readAllNote();
   return list;

  } 

  // Future<Note>
}
