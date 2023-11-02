import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:to_do/data/hive/hive_data.dart';
import 'package:to_do/global/notification_app.dart';

import 'package:to_do/global/validador_text.dart';
import 'package:to_do/model/note.dart';

class EditTask extends StatefulWidget {
  final Note _note;
  const EditTask(this._note, {super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  void initState() {
    super.initState();

    taskText = TextEditingController(text: widget._note.description);
  }

  TextEditingController? taskText;
  FocusNode focusNode = FocusNode();
  void _showSnackbar() {
    Fluttertoast.showToast(
        msg: 'Обновление не может быть пустым', gravity: ToastGravity.SNACKBAR);
  }

  late String time = dateTimeDeleteSeconds(widget._note.time.toString());
  TimeOfDay timeOfDay = TimeOfDay.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: widget._note.time,
      firstDate: DateTime(2023, 01, 01),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        if (value != null) {
          HiveDataBase().updateDatetime(widget._note, value);
        }

        time = dateTimeDeleteSeconds(value.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: iconButtonToBack(context),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(children: [
                taskTextforEdit(),
                const Divider(
                  color: Color.fromARGB(255, 168, 168, 168),
                ),
                editDate(),
                const Divider(
                  color: Color.fromARGB(255, 168, 168, 168),
                ),
                rington(),
                // if (widget._note.noteReplay != 'Нет')
                //   Column(
                //     children: [
                //       replayTime('напоминание в', widget._note.noteReplay),
                //       replayTime('Тип напоминание', 'Уведомление')
                //     ],
                //   ),
                const Divider(
                  color: Color.fromARGB(255, 168, 168, 168),
                ),
                someThing()
              ]))),
    );
  }

  InkWell replayTime(String type, String subType) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 24),
            Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(type,
                    style: const TextStyle(color: Colors.grey, fontSize: 20)),
              ),
            ),
            Text(subType,
                style: const TextStyle(color: Colors.grey, fontSize: 20)),
          ],
        ),
      ),
    );
  }

  InkWell someThing() {
    return InkWell(
      onTap: () {},
      child: const SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.repeat, size: 24, color: Colors.grey),
            Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Повторить задание",
                    style: TextStyle(color: Colors.grey, fontSize: 20)),
              ),
            ),
            Text('Нет', style: TextStyle(color: Colors.grey, fontSize: 20)),
          ],
        ),
      ),
    );
  }

  InkWell rington() {
    return InkWell(
      onTap: () async {
        TimeOfDay? timeToPick =
            await showTimePicker(context: context, initialTime: timeOfDay);
        if (timeToPick == null) return;
        setState(() {
          timeOfDay = timeToPick;

          // HiveDataBase()
          // .updateReplayTime(widget._note, timeToPick.format(context));
        });
      },
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.access_time, size: 24, color: Colors.grey),
            const Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Время & Напоминание',
                    style: TextStyle(color: Colors.grey, fontSize: 20)),
              ),
            ),
            Text(widget._note.time.toString(),
                style: const TextStyle(color: Colors.grey, fontSize: 20)),
          ],
        ),
      ),
    );
  }

  InkWell editDate() {
    return InkWell(
      onTap: () {
        _showDatePicker();
      },
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.calendar_month_outlined,
                size: 24, color: Colors.grey),
            const Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Срок по задаче",
                    style: TextStyle(color: Colors.grey, fontSize: 20)),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(time,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.75), fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget taskTextforEdit() {
    return TextField(
      autofocus: true,
      maxLines: 6,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        border: InputBorder.none,
      ),
      controller: taskText,
      focusNode: focusNode,
    );
  }

  IconButton iconButtonToBack(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      iconSize: 30,
      color: Colors.black,
      onPressed: () {
        if (taskText!.text.isEmpty) {
          return _showSnackbar();
        }
        HiveDataBase().update(widget._note, taskText!.text);
        Navigator.of(context).pop(context);
      },
    );
  }
}
