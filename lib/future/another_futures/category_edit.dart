import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do/data/drift_datebase_providers/note_category_data.dart';
import 'package:to_do/domain/model/category_note.dart';

class Editcategory extends StatefulWidget {
  const Editcategory({super.key});

  @override
  State<Editcategory> createState() => _EditcategoryState();
}

class _EditcategoryState extends State<Editcategory> {
  List<CategoryNote> categoryListNote = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: ListView(
        children: categoryListNote
            .map((e) => listTileAboutCategory(e))
            .skip(1)
            .toList(),
      ),
    );
  }

  Widget listTileAboutCategory(CategoryNote categoryNote) {
    return ListTile(
      title: Text(categoryNote.category),
      trailing: categoryNote.id > 3
          ? IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showAlert(categoryNote);
              },
            )
          : null,
    );
  }

  void showAlert(CategoryNote categoryNote) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Удалить задание?'),
            actions: [
              TextButton(
                  onPressed: () {
                    if (false) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                  "Вы не можете удалить так как есть экзапляр категории"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'))
                              ],
                            );
                          });
                    }

                    // unawaited(HiveCategoryDataBase()
                    //     .deleteCategoryNote(categoryNote));
                    Navigator.pop(context);
                  },
                  child: const Text('Удалить')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                  child: const Text('Отмена')),
            ],
          );
        });
  }
}
