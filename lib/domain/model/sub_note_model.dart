import 'package:drift/drift.dart';
import 'package:to_do/data/drift/drift_db.dart';

class SubNoteModel {
  final String description;
  final int id;
  final int parentId;
  final String? comment;
  final int importanceValue; // max 10 min 0

  SubNoteModel(
      {required this.parentId,
      required this.id,
      required this.description,
      this.comment,
      int? importanceValue})
      : importanceValue = importanceValue ?? 0;

  SubNoteModel.empty()
      : parentId = 0,
        comment = '',
        importanceValue = 0,
        description = '',
        id = 0;

  SubNoteModel copyWith(
      {int? parentId,
      int? id,
      String? comment,
      String? description,
      int? importanceValue}) {
    return SubNoteModel(
        parentId: parentId ?? this.parentId,
        id: id ?? this.id,
        description: description ?? this.description,
        comment: comment ?? this.comment,
        importanceValue: importanceValue ?? this.importanceValue);
  }

  static SubNotesCompanion toCompanion(SubNoteModel subNoteModel) {
    return SubNotesCompanion(
      description: Value(subNoteModel.description),
      parentId: Value(subNoteModel.parentId),
      comment: Value(subNoteModel.comment),
      importanceValue: Value(subNoteModel.importanceValue),
    );
  }

  SubNoteModel.fromCompanion(SubNote subNote)
      : parentId = subNote.parentId,
        comment = subNote.comment,
        importanceValue = subNote.importanceValue ?? 0,
        description = subNote.description,
        id = subNote.id;
}
