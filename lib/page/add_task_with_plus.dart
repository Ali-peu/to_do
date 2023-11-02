import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/data/hive/hive_data.dart';
import 'package:to_do/data/hive/note_category_data.dart';
import 'package:to_do/model/category_note.dart';

import 'package:to_do/model/note.dart';
import 'package:uuid/uuid.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final box = Hive.box<CategoryNote>('boxCategory');
  @override
  void initState() {
    super.initState();

    HiveCategoryDataBase().initBoxCategory();
    categoryListNote = box.values.toList();
  }

  final subtitle = TextEditingController();
  final categoryContoller = TextEditingController();

  int _dropDownButtonValue = 1;

  DateTime dateTime = DateTime.now();
  List<CategoryNote> categoryListNote = [];
  List<String> categoryList = ['All', 'Work', 'Study'];
  String category = 'All';

  late var firstValueCategory = box.values.first.category;

  String noteReplaytime = 'Нет';

  List<Note> toDoTask = [];

  final FocusNode _focusNode2 = FocusNode();
  void saveTask() async {
    await Hive.openBox<Note>('box');
    setState(() {
      HiveDataBase().saveNote(Note(
        description: subtitle.text,
        id: const Uuid().v4(),
        isDone: false,
        time: DateUtils.dateOnly(dateTime),
        category: category,
        isThisStar: false,
      ));
      Hive.box<Note>('box');
    });
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2023, 01, 01),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        if (mounted && value != null && value != dateTime) {
          dateTime = value;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: subtiteWidget(),
                ))),
        Row(
          children: [
            Expanded(
                child: Row(children: [
              Container(
                height: 30,
                width: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.19)),
                child: DropdownButton(
                  icon: const Visibility(
                      visible: false, child: Icon(Icons.arrow_downward)),
                  value: _dropDownButtonValue,
                  items: [
                    // DropdownMenuItem(
                    //     value: 4,
                    //     child: const Text(
                    //       'Новая категория',
                    //       style: TextStyle(decoration: TextDecoration.none),
                    //     ),
                    //     onTap: () {}),
                    for (var i in categoryListNote) {}
                  ],
                  onChanged: (value) {
                    if (value == 4) {
                      showAlertDialog();
                    }
                    setState(() {
                      _dropDownButtonValue = value!;
                      category;
                    });
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit_calendar_outlined),
                onPressed: () {
                  _showDatePicker();
                },
              ),
            ])),
            button(),
          ],
        )
      ],
    );
  }

  DropdownMenuItem<int> dropdownButtonForCategory(CategoryNote categoryNote) {
    return DropdownMenuItem(
      value: categoryNote.id,
      child: Text(
        categoryNote.category,
        style: const TextStyle(decoration: TextDecoration.none),
      ),
      onTap: () {
        setState(() {
          if (categoryNote.category == 'No category') {
            firstValueCategory = 'All';
          }
          firstValueCategory = categoryNote.category;
        });
      },
    );
  }

  Widget button() {
    return ElevatedButton(
        onPressed: () async {
          if (subtitle.text.isEmpty) {
            return Navigator.pop(context);
          }
          saveTask();
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
        ),
        child: const Icon(Icons.keyboard_double_arrow_up_outlined,
            color: Colors.white));
  }

  Widget subtiteWidget() {
    return TextField(
      maxLines: 1,
      autofocus: true,
      controller: subtitle,
      onEditingComplete: () {
        saveTask();
      },
      focusNode: _focusNode2,
      style: const TextStyle(fontSize: 18, color: Colors.black),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        hintText: 'Введите здесь новую задачу',
        border: InputBorder.none,
      ),
    );
  }

  void showAlertDialog() {
    print('is it working?');
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Добавить категорию?'),
            content: TextField(
              controller: categoryContoller,
              onSubmitted: (value) {
                categoryList.add(value);
              },
              decoration: const InputDecoration(hintText: 'Напишите категорию'),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    categoryList.add(categoryContoller.text);

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
    print(categoryList);
  }
}
