import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintext;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final double? borderRadius;
  final TextStyle? style;
  final double? fontSize;

  const AppTextField(
      {required this.controller,
      super.key,
      this.hintext,
      this.focusNode,
      this.prefixIcon,
      this.borderColor,
      this.suffixIcon,
      this.borderRadius,
      this.enabledBorderColor, this.style, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: style ??   TextStyle(fontSize: fontSize ?? 12),
        decoration: InputDecoration(
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: borderColor ?? Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(borderRadius ?? 0)),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          hintText: hintext,
          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(10),
          //     borderSide: BorderSide(
          //         width: 2,
          //         color: enabledBorderColor ?? Theme.of(context).primaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 2,
                  color: borderColor ?? Theme.of(context).primaryColor)),
        ));
  }
}


void showAlertDialog(
    BuildContext context, TextEditingController categoryContoller) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Добавить категорию?'),
          content: TextField(
            controller: categoryContoller,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Напишите категорию'),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  // if (categoryContoller.text.isNotEmpty) {
                  //   HiveCategoryDataBase().saveCategoryNote(CategoryNote(
                  //       id: box.values.toList().length,
                  //       category: categoryContoller.text));
                  // }

                  Navigator.of(context).pop(context);
                },
                child: const Text('Добавить')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                child: const Text('Отмена')),
          ],
        );
      });
}
