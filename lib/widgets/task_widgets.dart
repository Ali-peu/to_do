import 'package:flutter/material.dart';
import 'package:to_do/data/firestore.dart';
import 'package:to_do/global/deskription_task.dart';
import 'package:to_do/global/validador_text.dart';
import 'package:to_do/model/note.dart';

class TaskWidget extends StatefulWidget {
  Note _note;
  TaskWidget(this._note, {super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  TextEditingController taskDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widht = MediaQuery.of(context).size.height * 0.9;
    double height = MediaQuery.of(context).size.height * 0.1;
    bool isDone = widget._note.isDone;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditTask(widget._note),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: widht,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey.withOpacity(0.01),
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
                style: TextStyle(fontSize: 25),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Checkbox(
                  splashRadius: 8,
                  value: isDone,
                  onChanged: (value) {
                    setState(() {
                      isDone = !isDone;
                    });
                    FirebaseDatasource().isdone(widget._note.id, isDone);
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
