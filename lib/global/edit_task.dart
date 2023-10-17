import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/data/firestore.dart';
import 'package:to_do/global/validador_text.dart';
import 'package:to_do/model/note.dart';

class EditTask extends StatefulWidget {
  final Note _note;
  const EditTask(this._note, {super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  TextEditingController? taskText;
  FocusNode focusNode = FocusNode();

  late String time =
      dateTimeDeleteSeconds(widget._note.time.toDate().toString());

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: widget._note.time.toDate(),
      firstDate: DateTime(2023, 01, 01),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        FirebaseDatasource()
            .updateDeadline(widget._note.id, Timestamp.fromDate(value!));
        time = dateTimeDeleteSeconds(value.toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    taskText = TextEditingController(text: widget._note.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        scrolledUnderElevation: 0,
        leading: iconButtonToBack(context),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(children: [
                taskTextforEdit(),
                editDate(),
                rington(),
                someThing()
              ]))),
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
            Text("Нет", style: TextStyle(color: Colors.grey, fontSize: 20)),
          ],
        ),
      ),
    );
  }

  InkWell rington() {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.access_time, size: 24, color: Colors.grey),
            Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget._note.category,
                    style: const TextStyle(color: Colors.grey, fontSize: 20)),
              ),
            ),
            const Text("Нет",
                style: TextStyle(color: Colors.grey, fontSize: 20)),
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

  Container taskTextforEdit() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: TextField(
        autofocus: true,
        maxLines: 6,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          border: InputBorder.none,
        ),
        controller: taskText,
        focusNode: focusNode,
      ),
    );
  }

  IconButton iconButtonToBack(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      iconSize: 30,
      color: Colors.black,
      onPressed: () {
        FirebaseDatasource().updateTask(widget._note.id, taskText!.text);
        Navigator.of(context).pop(context);
      },
    );
  }
}
