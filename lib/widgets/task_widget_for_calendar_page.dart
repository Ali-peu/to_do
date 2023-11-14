import 'package:flutter/material.dart';

import 'package:to_do/global/validador_text.dart';
import 'package:to_do/model/note.dart';

class TaskWidgetForCalendar extends StatelessWidget {
  final Note _note;
  const TaskWidgetForCalendar(this._note, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
            title: Text(
          showCorrectTextInTaskContainer(_note.description),
          style: const TextStyle(fontSize: 25, color: Colors.black),
        )),
      ),
    );
  }
}
