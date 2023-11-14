import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/data/hive/hive_data.dart';
import 'package:to_do/data/hive/note_category_data.dart';
import 'package:to_do/model/category_note.dart';
import 'package:to_do/model/note.dart';

class Editcategory extends StatefulWidget {
  const Editcategory({super.key});

  @override
  State<Editcategory> createState() => _EditcategoryState();
}

class _EditcategoryState extends State<Editcategory> {
  final box = Hive.box<CategoryNote>('boxCategory');
  List<CategoryNote> categoryListNote = [];
  final noteBox = Hive.box<Note>('box');

  @override
  void initState() {
    super.initState();
    noteBox;
    categoryListNote = box.values.toList();
    box.watch().listen((event) {
      if (mounted) {
        setState(() {}); // Обновляет экран не удалять
      }
    });
  }

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
                    if (HiveDataBase()
                        .searchNoteWithCategory(categoryNote.category)) {
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

                    unawaited(HiveCategoryDataBase()
                        .deleteCategoryNote(categoryNote));
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
