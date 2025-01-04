import 'package:drift/drift.dart';
import 'package:to_do/data/drift/drift_db.dart';

class LinearModel {
  final int id;
  final int noteId;
  final int strokeWidth;
  final String colorHex;

  LinearModel(
      {required this.noteId,
      required this.id,
      required this.strokeWidth,
      required this.colorHex});

  static NoteLinearCompanion toCompanion(LinearModel linearModel) {
    return NoteLinearCompanion(
        strokeWidth: Value(linearModel.strokeWidth),
        noteId: Value(linearModel.noteId),
        colorHex: Value(linearModel.colorHex));
  }

  LinearModel.fromComponion(NoteLinearData model)
      : id = model.id,
        strokeWidth = model.strokeWidth,
        noteId = model.noteId,
        colorHex = model.colorHex;
}
