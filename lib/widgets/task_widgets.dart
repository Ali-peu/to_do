import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:to_do/data/hive_data.dart';
import 'package:to_do/global/app_colors.dart';
import 'package:to_do/global/edit_task.dart';

import 'package:to_do/global/validador_text.dart';
import 'package:to_do/model/note.dart';

class TaskWidget extends StatefulWidget {
  final Note _note;
  const TaskWidget(this._note, {super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isDone = false;
  TextEditingController taskDescription = TextEditingController();
  late DateTime dateTime = widget._note.time;

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
          HiveDataBase().updateDatetime(widget._note, dateTime);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(25.0)),
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => (showAlertDialog()),
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (context) => (_showDatePicker()),
                backgroundColor: const Color.fromARGB(255, 66, 141, 232),
                foregroundColor: Colors.white,
                icon: Icons.date_range_rounded,
                label: 'Data',
              ),
              SlidableAction(
                onPressed: (context) => (HiveDataBase().starNote(
                  widget._note,
                  widget._note.isThisStar,
                )),
                backgroundColor: const Color.fromARGB(255, 233, 242, 61),
                foregroundColor: Colors.white,
                icon: widget._note.isThisStar ? Icons.star : Icons.star_border,
                label: 'Star',
              )
            ],
          ),
          child: ColoredBox(
            color: StyleApp().taskColoR,
            child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditTask(widget._note),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: const Icon(Icons.flag_outlined),
                  onPressed: () {},
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                  side: const BorderSide(color: Colors.black),
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: noteTitleText(),
                ),
                subtitle: boolCheckDeaadline(widget._note.time)
                    ? null
                    : Text(
                        deadlineTask(widget._note.time.toString()),
                        style: TextStyle(
                            color: isThatDeadlineAsGone(widget._note.time)
                                ? Colors.black
                                : const Color.fromARGB(255, 255, 17, 0),
                            fontSize: 12),
                      ),
                leading: IconButton(
                    onPressed: () {
                      HiveDataBase().isdone(widget._note, widget._note.isDone);
                    },
                    icon: widget._note.isDone
                        ? const Icon(Icons.expand_circle_down_rounded)
                        : const Icon(Icons.expand_circle_down_outlined))),
          )),
    );
  }

  Widget showAlertDialog() {
    return AlertDialog(
      title: const Text('Удалить задание?'),
      actions: [
        TextButton(
            onPressed: () {
              HiveDataBase().deleteNote(widget._note);
            },
            child: const Text('Удалить')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            child: const Text('Отмена')),
      ],
    );
  }

  Text noteTitleText() {
    return Text(
      showCorrectTextInTaskContainer(widget._note.description),
      maxLines: 1,
      style: TextStyle(
          fontSize: 25,
          decoration: widget._note.isDone
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          color: widget._note.isDone ? Colors.grey : Colors.black),
    );
  }
}
