part of 'draw_bloc.dart';

abstract class DrawEvent extends Equatable {
  const DrawEvent();

  @override
  List<Object?> get props => [];
}

class SetColor extends DrawEvent {
  final Color color;

  const SetColor(this.color);

  @override
  List<Object?> get props => [color];
}

class SetStrokeWidth extends DrawEvent {
  final double strokeWidth;

  const SetStrokeWidth(this.strokeWidth);

  @override
  List<Object?> get props => [strokeWidth];
}

class OnPanStart extends DrawEvent {
  final DrawingPoints points;

  const OnPanStart(this.points);

  @override
  List<Object?> get props => [points];
}

class OnPanUpdate extends DrawEvent {
  final DrawingPoints drawingPoints;

  const OnPanUpdate(this.drawingPoints);

  @override
  List<Object?> get props => [drawingPoints];
}

class OnPanEnd extends DrawEvent {
  const OnPanEnd();
}

class ClearDrawing extends DrawEvent {
  const ClearDrawing();
}

class GetData extends DrawEvent{
  final List<DrawingPoints?> list;

  const GetData({required this.list});
}
