import 'package:drift/drift.dart';
import 'package:to_do/data/drift/drift_db.dart';

class NoteTextModel {
  final int id;
  final String description;
  final int noteId;
  final int textStyle; // 1=курсив, 2=жирный
  final String colorHex;

  NoteTextModel({
    required this.id,
    required this.description,
    required this.noteId,
    required this.textStyle,
    required this.colorHex,
  });

  // Пример методов для преобразования в/из JSON:
  factory NoteTextModel.fromJson(Map<String, dynamic> json) {
    return NoteTextModel(
      id: json['id'] as int? ?? 0,
      description: json['text'] as String? ?? '',
      noteId: json['noteId'] as int? ?? 0,
      textStyle: json['textStyle'] as int? ?? 0,
      colorHex: json['colorID'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'noteId': noteId,
      'textStyle': textStyle,
      'colorID': colorHex,
    };
  }

  static NoteTextsCompanion toCompanion(NoteTextModel noteTextModel) {
    return NoteTextsCompanion(
        description: Value(noteTextModel.description),
        colorHex: Value(noteTextModel.colorHex),
        noteId: Value(noteTextModel.noteId),
        textStyle: Value(noteTextModel.textStyle));
  }

  NoteTextModel.fromComponion(NoteText noteText)
      : description = noteText.description,
        id = noteText.id,
        colorHex = noteText.colorHex,
        noteId = noteText.noteId,
        textStyle = noteText.textStyle;
}
