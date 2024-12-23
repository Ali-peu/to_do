import 'package:drift/drift.dart';
import 'package:to_do/data/drift/drift_db.dart';

class NoteModel  {
  final String description;
  final int id;

  final DateTime? deadlineTime;
  final bool isDone;
  final String category;
  final bool isThisStar;
  final DateTime? remindTime;
  final DateTime createdTime;
  final DateTime? updatedTime;
  final DateTime? deletedTime;
  final List<int>? subNoteIdList;

  NoteModel({
    required this.description,
    required this.id,
    required this.isDone,
    required this.category,
    required this.isThisStar,
    this.deadlineTime,
    this.subNoteIdList,
    this.remindTime,
    DateTime? createdTime,
    this.deletedTime,
    this.updatedTime,
  }) : createdTime = createdTime ??
            DateTime.now(); // Устанавливаем текущее время, если не передано

  static NotesCompanion toCompanion(NoteModel note) {
    return NotesCompanion(
        description: Value(note.description),
        isDone: Value(note.isDone),
        category: Value(note.category),
        isThisStar: Value(note.isThisStar),
        time: Value(note.deadlineTime),
        remindTime: Value(note.remindTime),
        createdTime: Value(note.createdTime),
        updatedTime: Value(note.updatedTime),
        deletedTime: Value(note.deletedTime));
  }

  NoteModel.fromCompanion(Note note)
      : isDone = note.isDone,
        category = note.category,
        isThisStar = note.isThisStar,
        deadlineTime = note.time,
        remindTime = note.remindTime,
        createdTime = note.createdTime,
        updatedTime = note.updatedTime,
        deletedTime = note.deletedTime,
        subNoteIdList = [],
        description = note.description,
        id = note.id;
}
