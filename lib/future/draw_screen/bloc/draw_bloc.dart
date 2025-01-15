import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:to_do/future/custom_painter/drawing_points_model.dart';

part 'draw_event.dart';
part 'draw_state.dart';

class DrawBloc extends Bloc<DrawEvent, DrawState> {
  DrawBloc() : super(DrawState()) {
    on<SetColor>((event, emit) {
      emit(state.copyWith(currentColor: event.color));
    });

    on<SetStrokeWidth>((event, emit) {
      emit(state.copyWith(currentStrokeWidth: event.strokeWidth));
    });
    on<OnPanStart>((event, emit) {
      final updated = List<DrawingPoints?>.from(state.points)
        ..add(event.points);
      emit(state.copyWith(points: updated));
    });

    on<OnPanUpdate>((event, emit) {
      final updated = List<DrawingPoints?>.from(state.points)
        ..add(event.drawingPoints);
      emit(state.copyWith(points: updated));
    });

    on<OnPanEnd>((event, emit) {
      final updated = List<DrawingPoints?>.from(state.points)..add(null);
      emit(state.copyWith(points: updated));
    });

    on<ClearDrawing>((event, emit) {
      emit(state.copyWith(points: []));
    });

    on<GetData>((event, emit) {
      emit(state.copyWith(points: event.list));
    });
  }
}
