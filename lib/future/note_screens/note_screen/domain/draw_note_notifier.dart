import 'package:flutter/material.dart';
import 'package:to_do/configuration/extension/color_extension.dart';
import 'package:to_do/domain/model/linear_model.dart';
import 'package:to_do/future/custom_painter/drawing_points_model.dart';
import 'package:to_do/future/note_screens/note_screen/bloc/note_screen_bloc.dart';

class DrawNoteNotifier extends ChangeNotifier {
  List<DrawingPoints?> _drawingPoints = [];

  List<DrawingPoints?> get drawingPoints => _drawingPoints;
  set drawingPoints(List<DrawingPoints?> value) {
    _drawingPoints = value;
    notifyListeners();
  }

  void setDrawingPointsFromLinearModelList(List<LinearModel> data) {
    _drawingPoints = data
        .map((e) => e.strokeWidth == 0
            ? null
            : DrawingPoints(
                points: e.position,
                paint: Paint()
                  ..color = e.colorHex.toColor()
                  ..strokeWidth = e.strokeWidth
                  ..strokeCap = StrokeCap.round))
        .toList();
    notifyListeners();
  }

  void onPanEnd(
      NoteScreenStatus noteScreenStatus, void Function() blockFunction) {
    if (noteScreenStatus == NoteScreenStatus.drawing) {
      blockFunction();
    }
  }

  void onPanStart(
      {required NoteScreenStatus noteScreenStatus,
      required void Function(DrawingPoints) blockFunction,
      required Offset pointPosition,
      required StrokeCap strokeCap,
      required Color currentColor,
      required double currentStrokeWidth}) {
    if (noteScreenStatus == NoteScreenStatus.drawing) {
      final data = DrawingPoints(
          points: pointPosition,
          paint: Paint()
            ..strokeCap = strokeCap
            ..isAntiAlias = true
            ..color = currentColor
            ..strokeWidth = currentStrokeWidth);
      blockFunction(data);
    }
  }

  void onPanUpdate(
      {required NoteScreenStatus noteScreenStatus,
      required void Function(DrawingPoints) blockFunction,
      required Offset pointPosition,
      required StrokeCap strokeCap,
      required Color currentColor,
      required double currentStrokeWidth}) {
    if (noteScreenStatus == NoteScreenStatus.drawing) {
      final data = DrawingPoints(
          points: pointPosition,
          paint: Paint()
            ..strokeCap = strokeCap
            ..isAntiAlias = true
            ..color = currentColor
            ..strokeWidth = currentStrokeWidth);

      blockFunction(data);
    }
  }
}
