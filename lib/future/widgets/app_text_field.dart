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
  final bool? autofocus;
  final TextStyle? hintTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isDense;
  final int? maxLines;
  final double? borderWidth;

  const AppTextField(
      {required this.controller,
      super.key,
      this.hintext,
      this.focusNode,
      this.prefixIcon,
      this.borderColor,
      this.suffixIcon,
      this.borderRadius,
      this.enabledBorderColor,
      this.style,
      this.fontSize,
      this.autofocus,
      this.hintTextStyle,
      this.contentPadding,
      this.isDense,
      this.maxLines,
      this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        // scrollPadding: EdgeInsets.zero,
        style: style ?? TextStyle(fontSize: fontSize ?? 12),
        minLines: 1, // Показывает одну строку, если текст отсутствует
        maxLines: maxLines, // Указывает максимальное количество строк
        decoration: InputDecoration(
          isDense: isDense ?? true,
          hintStyle: hintTextStyle,

          contentPadding: contentPadding ?? EdgeInsets.zero,
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(borderRadius ?? 0)),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          // contentPadding:
          //     const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          hintText: hintext,
          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(10),
          //     borderSide: BorderSide(
          //         width: 2,
          //         color: enabledBorderColor ?? Theme.of(context).primaryColor)),
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
              borderSide: BorderSide(
                  width: borderWidth ?? 1,
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
