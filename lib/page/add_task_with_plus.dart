import 'package:flutter/material.dart';

import 'package:to_do/data/firestore.dart';
import 'package:to_do/data/hive_box.dart';
import 'package:to_do/global/validador_text.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final subtitle = TextEditingController();
  int _value = 1;
  DateTime dateTime = DateTime.now();
  late String category = 'No category';

  final FocusNode _focusNode2 = FocusNode();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2023, 01, 01),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
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
                    value: _value,
                    items: [
                      dropdownButtonForCategory(3, 'Study'),
                      dropdownButtonForCategory(2, 'Work'),
                      dropdownButtonForCategory(1, 'No category'),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
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
      ),
    );
  }

  DropdownMenuItem<int> dropdownButtonForCategory(int value, String category) {
    return DropdownMenuItem(
      value: value,
      child: Text(
        category,
        style: const TextStyle(decoration: TextDecoration.none),
      ),
      onTap: () {
        setState(() {
          category = this.category;
        });
      },
    );
  }

  Widget button() {
    return ElevatedButton(
        onPressed: () {
          FirebaseDatasource().AddNote(subtitle.text, dateTime, category);
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
      focusNode: _focusNode2,
      style: const TextStyle(fontSize: 18, color: Colors.black),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        hintText: 'Введите здесь новую задачу',
        border: InputBorder.none,
      ),
    );
  }
  // Future _displayBottomSheet(BuildContext context, double height){
  //   return
  // }
}
