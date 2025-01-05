import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:to_do/data/drift/drift_db.dart';

class LinearModel {
  final int id;
  final int noteId;
  final int strokeWidth;
  final String colorHex;
  final List<double> dxPositions;
  final List<double> dyPositions;

  LinearModel({
    required this.noteId,
    required this.id,
    required this.strokeWidth,
    required this.colorHex,
    required this.dxPositions,
    required this.dyPositions,
  });

  static String serializeList(List<double> list) {
    return json.encode(list);
  }

  // Метод для преобразования строки обратно в List<double>
  static List<double> deserializeList(String? list) {
    if (list == null) return [];
    return List<double>.from(json.decode(list) as List<dynamic>);
  }

  static NoteLinearCompanion toCompanion(LinearModel linearModel) {
    final dxPositionsSerialized = serializeList(linearModel.dxPositions);
    final dyPositionsSerialized = serializeList(linearModel.dyPositions);
    return NoteLinearCompanion(
      strokeWidth: Value(linearModel.strokeWidth),
      noteId: Value(linearModel.noteId),
      colorHex: Value(linearModel.colorHex),
      dxPositions: Value(dxPositionsSerialized),
      dyPositions: Value(dyPositionsSerialized),
    );
  }

  List<Offset> toOffset() {
    if (dxPositions.length != dyPositions.length) {
      throw ArgumentError(
          'dxPositions length is ${dxPositions.length}, and dyPositions is ${dyPositions.length}. n\ dxPostions: $dxPositions n\ dyPositions: $dyPositions  ');
    }
    final list = <Offset>[];
    for (var i = 0; i < dxPositions.length; i++) {
      list.add(Offset(dxPositions[i], dyPositions[i]));
    }
    return list;
  }

  LinearModel.fromComponion(NoteLinearData model)
      : id = model.id,
        strokeWidth = model.strokeWidth,
        noteId = model.noteId,
        colorHex = model.colorHex,
        dxPositions = deserializeList(model.dxPositions),
        dyPositions = deserializeList(model.dyPositions);
}
