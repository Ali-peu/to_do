import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/future/custom_painter/app_custom_painter.dart';
import 'package:to_do/future/draw_screen/bloc/draw_bloc.dart';

class DrawScreen extends StatelessWidget {
  const DrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawBloc, DrawState>(
      builder: (context, state) {
        return CustomPaint(
          size: Size.infinite,
          painter: DrawingPainter(
            pointsList: state.points,
          ),
        );
      },
    );
  }
}
