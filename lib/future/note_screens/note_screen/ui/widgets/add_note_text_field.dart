import 'package:flutter/material.dart';

class AddNoteTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintext;
  final TextStyle? textStyle;
  const AddNoteTextField(
      {required this.controller,
      super.key,
      this.hintext = 'Текст...',
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        maxLines: null,
        autofocus: true,
        style: textStyle,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 4),
            hintText: hintext,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.zero, borderSide: BorderSide.none)));
  }
}
