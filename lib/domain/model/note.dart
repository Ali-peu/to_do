import 'package:drift/drift.dart';
import 'package:to_do/data/drift/drift_db.dart';

class NoteModel  {
  final int id;
  final String category;
  final bool isFavourite;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final DateTime? deletedTime;

  NoteModel({
    required this.id,
    required this.category,
    required this.isFavourite,
    DateTime? createdTime,
    this.deletedTime,
    this.updatedTime,
  }) : createdTime = createdTime ??
            DateTime.now(); // Устанавливаем текущее время, если не передано

  static NotesCompanion toCompanion(NoteModel note) {
    return NotesCompanion(
        category: Value(note.category),
        isFavourite: Value(note.isFavourite),
        createdTime: Value(note.createdTime),
        updatedTime: Value(note.updatedTime),
        deletedTime: Value(note.deletedTime));
  }

  NoteModel.fromCompanion(Note note)
:        category = note.category,
        isFavourite = note.isFavourite,
        createdTime = note.createdTime,
        updatedTime = note.updatedTime,
        deletedTime = note.deletedTime,
        id = note.id;
}
