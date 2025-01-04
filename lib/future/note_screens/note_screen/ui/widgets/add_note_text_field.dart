import 'package:flutter/material.dart';

class AddNoteTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintext;
  const AddNoteTextField(
      {required this.controller, super.key, this.hintext = 'Текст...'});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        maxLines: null,
        autofocus: true,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 4),
            hintText: hintext,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.zero, borderSide: BorderSide.none)));
  }
}
