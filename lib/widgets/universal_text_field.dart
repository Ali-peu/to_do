import 'package:flutter/material.dart';
import 'package:to_do/global/app_colors.dart';
import 'package:to_do/global/validador_text.dart';

Widget universalTextFormField(
    TextEditingController controller,
    FocusNode focusNode,
    String typeName,
    IconData iconData,
    TextEditingController? passwordConfirmController) {
  return TextFormField(
    controller: controller,
    focusNode: focusNode,
    validator: (value) {
      switch (typeName) {
        case 'Email':
          return emailCheck(controller.text);
        case 'Password':
          return passwordCheck(controller.text);
        case 'Please repeat the password':
          return passwordConfirmCheck(
              controller.text, passwordConfirmController!.text);
        default:
          return 'Please connect with a developer';
      }
    },
    style: const TextStyle(fontSize: 18, color: Colors.black),
    decoration: InputDecoration(
      focusedErrorBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      prefixIcon: Icon(Icons.email,
          color: focusNode.hasFocus
              ? StyleApp().focusedColor
              : StyleApp().inActiveWidgetsColor),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      hintText: typeName,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: StyleApp().focusedColor, width: 2.0)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: StyleApp().mainTheme, width: 2.0)),
    ),
  );
}
