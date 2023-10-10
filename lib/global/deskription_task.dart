import 'package:flutter/material.dart';
import 'package:to_do/data/firestore.dart';
import 'package:to_do/model/note.dart';

class EditTask extends StatefulWidget {
  Note _note;
  EditTask(this._note, {Key? key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  TextEditingController? taskText;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 30,
          color: Colors.black,
          onPressed: () {
            FirebaseDatasource().updataTask(widget._note.id, taskText!.text);
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                  child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    maxLines: 8,
                    controller: taskText,
                    focusNode: focusNode,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.calendar_month_outlined,
                            size: 24, color: Colors.grey),
                        Flexible(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Срок по задаче",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 20)),
                          ),
                        ),
                        Text("2023/10/08",
                            style: TextStyle(color: Colors.grey, fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.access_time, size: 24, color: Colors.grey),
                        Flexible(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Время & Напоминание",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 20)),
                          ),
                        ),
                        Text("Нет",
                            style: TextStyle(color: Colors.grey, fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.repeat, size: 24, color: Colors.grey),
                        Flexible(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Повторить задание",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 20)),
                          ),
                        ),
                        Text("Нет",
                            style: TextStyle(color: Colors.grey, fontSize: 20)),
                      ],
                    ),
                  ),
                )
              ])))),
    );
  }
}
