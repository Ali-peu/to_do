import 'dart:async';

import 'package:to_do/data/database_provider/database_provider.dart';
import 'package:to_do/data/drift/drift_db.dart';
import 'package:to_do/domain/model/sub_note_model.dart';

class DriftDatebaseProviderForSubNote extends DatabaseProvider<SubNoteModel> {
  final SubNoteDriftProvider subNoteDriftProvider;

  DriftDatebaseProviderForSubNote({required this.subNoteDriftProvider});

  @override
  Future<int?> createNoteForDB(SubNoteModel model) async {
    final id = await subNoteDriftProvider.insertNote(model);
    return id;
  }

  @override
  Future<void> deleteNoteFromDB({required int id}) async {
    await subNoteDriftProvider.deleteNote(id: id);
  }

  @override
  Future<SubNoteModel?> readNoteFromDB({required int id}) async {
    final note = await subNoteDriftProvider.readNote(id: id);
    return note;
  }

  @override
  Future<void> clearDB() async {
    // TODO: implement clearDB
    // await noteDriftProvider.
    // throw UnimplementedError();
  }

  @override
  Future<SubNoteModel?> updateNoteInDB({required SubNoteModel model}) async {
    final updateNote = await subNoteDriftProvider.updateNote(model);

    return updateNote;
  }

  Future<void> createSubNotesModel() async {}

  @override
  Future<List<SubNoteModel>?> readAllNoteFromDB() async {
    final list = await subNoteDriftProvider.readAllNote();
    return list;
  }
}
