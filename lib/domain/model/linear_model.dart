import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:to_do/data/drift/drift_db.dart';

class LinearModel {
  final int id;
  final int noteId;
  final double strokeWidth;
  final String colorHex;
  final Offset position;

  LinearModel({
    required this.strokeWidth,
    required this.colorHex,
    required this.position,
    this.noteId = 0,
    this.id = 0,
  });

  static NoteLinearCompanion toCompanion(LinearModel linearModel) {
    return NoteLinearCompanion(
      strokeWidth: Value(linearModel.strokeWidth),
      noteId: Value(linearModel.noteId),
      colorHex: Value(linearModel.colorHex),
      dxPosition: Value(linearModel.position.dx),
      dyPosition: Value(linearModel.position.dy),
    );
  }

  LinearModel.fromComponion(NoteLinearData model)
      : id = model.id,
        strokeWidth = model.strokeWidth,
        noteId = model.noteId,
        colorHex = model.colorHex,
        position = Offset(model.dxPosition, model.dyPosition);
}
