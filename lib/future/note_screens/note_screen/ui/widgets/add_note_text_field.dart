import 'package:flutter/material.dart';

class AddNoteTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintext;
  final TextStyle? textStyle;
  final void Function(String?) onChanged;
  final void Function() onTap;

  const AddNoteTextField(
      {required this.controller,
      required this.onChanged,
      required this.onTap, super.key,
      this.hintext = 'Текст...',
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
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
