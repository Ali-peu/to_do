import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do/data/hive/hive_data.dart';

import 'package:to_do/global/edit_task.dart';
import 'package:to_do/global/validador_text.dart';
import 'package:to_do/model/note.dart';

import 'package:to_do/widgets/timer_frame.dart';

class TaskWidget extends StatefulWidget {
  final Note _note;
  const TaskWidget(this._note, {super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isDone = false;
  TextEditingController taskDescription = TextEditingController();

  DateTime? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => (showAlert()),
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (context) async {
                  DateTime? selectedTime =
                      await MyCustomCalendar().showCustomDatePickerPac(context);
                  HiveDataBase().updateDatetime(widget._note, selectedTime!);
                },
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
          child: noteListTile()),
    );
  }

  Widget noteListTile() {
    return Card(
      child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditTask(widget._note),
              ),
            );
          },
          onLongPress: () {
            Fluttertoast.showToast(msg: 'LongPress');
          },
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(1),
          //   side: const BorderSide(),
          // ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: noteTitleText(),
          ),
          subtitle: boolCheckDeaadline(widget._note.time)
              ? (widget._note.replayTime1 == widget._note.time
                  ? const Text('')
                  : Text(
                      TimeOfDay.fromDateTime(widget._note.replayTime1)
                          .toString(),
                      // style: TextStyle(
                      //     color:
                      //         // checkIsReplayTimeDeadline(widget._note.replayTime1)
                      //         //     ? Colors.black
                      //         //:
                      //         Theme.of(context).colorScheme.error)
                    ))
              : Text(
                  deadlineTask(widget._note.time.toString()),
                  style: TextStyle(
                      color: isThatDeadlineAsGone(widget._note.time)
                          ? Colors.black
                          : Theme.of(context).colorScheme.error,
                      fontSize: 12),
                ),
          leading: IconButton(
              onPressed: () {
                HiveDataBase().isdone(widget._note, widget._note.isDone);
              },
              icon: widget._note.isDone
                  ? const Icon(Icons.expand_circle_down_rounded)
                  : const Icon(Icons.expand_circle_down_outlined))),
    );
  }

  void showAlert() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Удалить задание?'),
            actions: [
              TextButton(
                  onPressed: () {
                    HiveDataBase().deleteNote(widget._note);
                    Navigator.of(context).pop(context);
                  },
                  child: const Text('Удалить',
                      style: TextStyle(color: Colors.black))),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                  child: const Text('Отмена',
                      style: TextStyle(color: Colors.black))),
            ],
          );
        });
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
