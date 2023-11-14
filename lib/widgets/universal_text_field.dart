import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/data/hive/note_category_data.dart';

import 'package:to_do/model/category_note.dart';

// Widget universalTextFormField(
//     TextEditingController controller,
//     FocusNode focusNode,
//     String typeName,
//     IconData iconData,
//     TextEditingController? passwordConfirmController) {
//   return TextFormField(
//     controller: controller,
//     focusNode: focusNode,
//     validator: (value) {
//       switch (typeName) {
//         case 'Email':
//           return emailCheck(controller.text);
//         case 'Password':
//           return passwordCheck(controller.text);
//         case 'Please repeat the password':
//           return passwordConfirmCheck(
//               controller.text, passwordConfirmController!.text);
//         default:
//           return 'Please connect with a developer';
//       }
//     },
//     style: const TextStyle(fontSize: 18, color: Colors.black),
//     decoration: InputDecoration(
//       focusedErrorBorder:
//           const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
//       prefixIcon: Icon(Icons.email,
//           color: focusNode.hasFocus
//               ? StyleApp().taskColoR
//               : StyleApp().inActiveWidgetsColor),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//       hintText: typeName,
//       enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: StyleApp().taskColoR, width: 2.0)),
//       focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: StyleApp().appColor, width: 2.0)),
//     ),
//   );
// }

void showAlertDialog(
    BuildContext context, TextEditingController categoryContoller, Box box) {
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
                  if (categoryContoller.text.isNotEmpty) {
                    HiveCategoryDataBase().saveCategoryNote(CategoryNote(
                        id: box.values.toList().length,
                        category: categoryContoller.text));
                  }

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
