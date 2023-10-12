import 'package:flutter/material.dart';

import 'package:to_do/data/firestore.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final title = TextEditingController();
  final subtitle = TextEditingController();

  final FocusNode _focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: subtiteWidget()),
        Row(
          children: [
            Flexible(
                child: Row(children: [
              Container(
                height: 15,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.withOpacity(0.19)),
                child: const Text(
                  'Без категории',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Icon(Icons.edit_calendar_outlined),
            ])),
            button()
          ],
        )
      ],
    );
  }

  Widget button() {
    return ElevatedButton(
        onPressed: () {
          FirebaseDatasource().AddNote(subtitle.text);
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

  Padding subtiteWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        maxLines: 1,
        controller: subtitle,
        focusNode: _focusNode2,
        style: const TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          hintText: 'Task',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xffc5c5c5),
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
