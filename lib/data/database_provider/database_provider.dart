import 'package:to_do/domain/model/note.dart';

abstract class DatabaseProvider<T> {
  Future<int?> createNoteForDB(T model);
  Future<T?> readNoteFromDB({required int id});
  Future<List<T>?> readAllNoteFromDB();

  Future<T?> updateNoteInDB({required T model});
  Future<void> deleteNoteFromDB({required int id});
  Future<void> clearDB();

}
