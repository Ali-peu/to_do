import 'package:flutter/material.dart';

class StarNoteIcon extends StatelessWidget {
  final bool isNoteStar;
  final void Function() onPressed;
  const StarNoteIcon(
      {required this.isNoteStar, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        iconSize: 25,
        icon: isNoteStar
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border_outlined));
  }
}
