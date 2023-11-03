import 'package:flutter/material.dart';
import 'package:to_do/global/app_colors.dart';

import 'package:to_do/global/validador_text.dart';
import 'package:to_do/model/note.dart';

class TaskWidgetForCalendar extends StatefulWidget {
  final Note _note;
  const TaskWidgetForCalendar(this._note, {super.key});

  @override
  State<TaskWidgetForCalendar> createState() => _TaskWidgetForCalendarState();
}

class _TaskWidgetForCalendarState extends State<TaskWidgetForCalendar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ColoredBox(
        color: StyleApp().taskColoR,
        child: ListTile(
          title: Text(
            showCorrectTextInTaskContainer(widget._note.description),
            style: const TextStyle(fontSize: 25, color: Colors.black),
          ),
          trailing: SizedBox(
            width: 25,
            height: 25,
            child: IconButton(
              icon: const Icon(Icons.flag_outlined),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
