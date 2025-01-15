part of 'draw_bloc.dart';

class DrawState extends Equatable {
  final List<DrawingPoints?> points;
  final Color currentColor;
  final double currentStrokeWidth;
  final StrokeCap strokeCap;

  const DrawState(
      {this.points = const [],
      this.currentColor = Colors.black,
      this.currentStrokeWidth = 3.0,
      this.strokeCap = StrokeCap.round});

  DrawState copyWith({
    List<DrawingPoints?>? points,
    Color? currentColor,
    double? currentStrokeWidth,
  }) {
    return DrawState(
      points: points ?? this.points,
      currentColor: currentColor ?? this.currentColor,
      currentStrokeWidth: currentStrokeWidth ?? this.currentStrokeWidth,
    );
  }

  @override
  List<Object?> get props => [points, currentColor, currentStrokeWidth];
}
