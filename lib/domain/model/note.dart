import 'package:drift/drift.dart';
import 'package:to_do/data/drift/drift_db.dart';

class NoteModel {
  String description;
  int id;
  DateTime time;
  bool isDone;
  String category;
  bool isThisStar;
  DateTime replayTime1;
  DateTime replayTime2;

  NoteModel({
    required this.description,
    required this.id,
    required this.isDone,
    required this.time,
    required this.category,
    required this.isThisStar,
    required this.replayTime1,
    required this.replayTime2,
  });

  static NotesCompanion toCompanion(NoteModel note) {
    return NotesCompanion(
      id: Value(note.id),
      description: Value(note.description),
      isDone: Value(note.isDone),
      category: Value(note.category),
      isThisStar: Value(note.isThisStar),
      time: Value(note.time),
      replayTime1: Value(note.replayTime1),
      replayTime2: Value(note.replayTime2),
    );
  }

  static NoteModel fromCompanion(Note note) {
      return NoteModel(
        id: (note.id),
        description: (note.description),
        isDone: (note.isDone),
        category: (note.category),
        isThisStar: (note.isThisStar),
        time: (note.time),
        replayTime1: (note.replayTime1),
        replayTime2: (note.replayTime2),
      );
  }
}
