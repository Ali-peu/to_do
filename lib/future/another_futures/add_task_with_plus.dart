import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/data/hive/hive_data.dart';
import 'package:to_do/data/hive/note_category_data.dart';
import 'package:to_do/domain/model/category_note.dart';

import 'package:to_do/domain/model/note.dart';
import 'package:to_do/future/widgets/timer_frame.dart';
import 'package:to_do/future/widgets/universal_text_field.dart';
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
    box.watch().listen((event) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  final subtitle = TextEditingController();
  final categoryContoller = TextEditingController();

  int _dropDownButtonValue = 1;

  DateTime selectedDate = DateTime.now();

  List<CategoryNote> categoryListNote = [];

  String category = 'All';

  late var firstValueCategory =
      box.values.where((element) => element.category == 'All').first;

  DateTime replayTime = MyCustomCalendar().replayTime == null
      ? DateTime.now()
      : MyCustomCalendar().replayTime!;

  final FocusNode _focusNode2 = FocusNode();
  void saveTask() async {
    Hive.box<Note>('box');
    setState(() {
      selectedDate; // Проверить нужен ли
    });

    unawaited(HiveDataBase().saveNote(Note(
        description: subtitle.text,
        id: const Uuid().v4(),
        isDone: false,
        time: selectedDate,
        category: firstValueCategory.category,
        isThisStar: false,
        replayTime1: replayTime,
        replayTime2: replayTime)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: subtiteWidget(),
                  ))),
          Row(
            children: [
              Expanded(
                  child: Row(children: [
                testDropMenu(),
                IconButton(
                  icon: const Icon(Icons.edit_calendar_outlined),
                  onPressed: () async {
                    selectedDate = await MyCustomCalendar()
                            .showCustomDatePickerPac(context) ??
                        DateTime.now();
                  },
                ),
              ])),
              button(),
            ],
          )
        ],
      ),
    );
  }

  DropdownMenuItem<int> dropdownButtonForCategory(CategoryNote categoryNote) {
    return DropdownMenuItem<int>(
      value: categoryNote.id,
      child: Text(
        categoryNote.category,
        style: const TextStyle(decoration: TextDecoration.none),
      ),
      onTap: () {
        setState(() {
          if (categoryNote.category == 'No category') {
            firstValueCategory.category = 'All';
          }
          firstValueCategory = categoryNote;
        });
      },
    );
  }

  Widget testDropMenu() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<int>(
          icon: const Visibility(visible: false, child: Text('')),
          onChanged: (value) {
            if (value == 0) {
              showAlertDialog(context, categoryContoller, box);
            }
            setState(() {
              _dropDownButtonValue = value!;
              firstValueCategory;
            });
          },
          value: _dropDownButtonValue,
          items: box.values.map((e) => dropdownButtonForCategory(e)).toList()),
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
        ),
        child: const Icon(
          Icons.keyboard_double_arrow_up_outlined,
        ));
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
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        hintText: 'Введите здесь новую задачу',
        border: InputBorder.none,
      ),
    );
  }
}
