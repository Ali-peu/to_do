import 'package:flutter/material.dart';

class DraggableWidget extends StatelessWidget {
  final Widget child;
  final BoxConstraints boxConstraints;
  final void Function(DraggableDetails)? onDragEnd;
  const DraggableWidget(
      {required this.child, required this.onDragEnd, required this.boxConstraints, super.key});

  @override
  Widget build(BuildContext context) {
    return Draggable(
        child: child,
        onDragEnd: onDragEnd,
        childWhenDragging: Opacity(opacity: 0.5, child: child),
        feedback: Container(
          constraints: boxConstraints,
          child: child,
        ));
  }
}
