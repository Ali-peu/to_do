import 'package:flutter/material.dart';

class AddFavourite extends StatelessWidget {
  final bool isFavor;

  const AddFavourite({required this.isFavor, super.key});

  @override
  Widget build(BuildContext context) {
    return isFavor
        ? const Icon(Icons.bookmark_outline_sharp)
        : const Icon(Icons.bookmark_outlined);
  }
}
