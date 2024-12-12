import 'package:drift/drift.dart';
import 'package:to_do/data/drift/drift_db.dart';

final now = DateTime.now();

class NoteModel {
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

  NoteModel({
    required this.description,
    required this.id,
    required this.isDone,
    this.deadlineTime,
    required this.category,
    required this.isThisStar,
    this.remindTime,
    DateTime? createdTime,
    this.deletedTime,
    this.updatedTime,
  }) : createdTime = createdTime ??
            DateTime.now(); // Устанавливаем текущее время, если не передано

  static NotesCompanion toCompanion(NoteModel note) {
    return NotesCompanion(
        id: Value(note.id),
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

  static NoteModel fromCompanion(Note note) {
    return NoteModel(
        id: (note.id),
        description: (note.description),
        isDone: (note.isDone),
        category: (note.category),
        isThisStar: (note.isThisStar),
        deadlineTime: (note.time),
        remindTime: (note.remindTime),
        createdTime: note.createdTime,
        updatedTime: note.updatedTime,
        deletedTime: note.deletedTime);
  }
}
