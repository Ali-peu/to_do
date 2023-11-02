import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/data/hive/note_category_data.dart';
import 'package:to_do/model/category_note.dart';

class Editcategory extends StatefulWidget {
  const Editcategory({super.key});

  @override
  State<Editcategory> createState() => _EditcategoryState();
}

class _EditcategoryState extends State<Editcategory> {
  final box = Hive.box<CategoryNote>('boxCategory');
  List<CategoryNote> categoryListNote = [];

  @override
  void initState() {
    super.initState();

    categoryListNote = box.values.toList();
    box.watch().listen((event) {
      setState(() {}); // Обновляет экран не удалять
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 30,
          color: Colors.black,
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
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          showAlert(categoryNote);
        },
      ),
    );
  }

  void showAlert(CategoryNote categoryNote) async {
    print('Открыта алерт удаление');
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Удалить задание?'),
            actions: [
              TextButton(
                  onPressed: () {
                    HiveCategoryDataBase().deleteCategoryNote(categoryNote);
                    Navigator.of(context).pop(context);
                    print('Задача удалене');
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
