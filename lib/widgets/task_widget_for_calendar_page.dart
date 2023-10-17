import 'package:flutter/material.dart';

import 'package:to_do/global/validador_text.dart';
import 'package:to_do/model/note.dart';

class TaskWidgetForCalendar extends StatefulWidget {
  final Note _note;
  const TaskWidgetForCalendar(this._note, {super.key});

  @override
  State<TaskWidgetForCalendar> createState() => _TaskWidgetForCalendarState();
}

class _TaskWidgetForCalendarState extends State<TaskWidgetForCalendar> {
  TextEditingController taskDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widht = MediaQuery.of(context).size.height * 0.9;
    double height = MediaQuery.of(context).size.height * 0.1;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: widht,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue.withOpacity(0.07),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.01),
                spreadRadius: 0,
                blurRadius: 0,
              )
            ]),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              showCorrectTextInTaskContainer(widget._note.description),
              maxLines: 1,
              style: TextStyle(
                  fontSize: 25,
                  decoration: widget._note.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: Colors.black),
            ),
          ),
        ]),
      ),
    );
  }
}
