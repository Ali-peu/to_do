import 'package:to_do/domain/model/note.dart';

abstract class DatabaseProvider {
  Future<int?> createNoteForDB(NoteModel note);
  Future<NoteModel?> readNoteFromDB({required int id});
  Future<NoteModel?> updateNoteInDB({required NoteModel note});
  Future<void> deleteNoteFromDB({required int id});
  Future<void> clearDB();

}
