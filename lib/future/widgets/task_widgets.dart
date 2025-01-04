import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do/domain/model/note.dart';
import 'package:to_do/future/widgets/timer_frame.dart';

class TaskWidget extends StatefulWidget {
  final NoteModel note;
  const TaskWidget(this.note, {super.key});

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
                  // HiveDataBase().updateDatetime(widget.note, selectedTime ?? DateTime.now());
                },
                backgroundColor: const Color.fromARGB(255, 66, 141, 232),
                foregroundColor: Colors.white,
                icon: Icons.date_range_rounded,
                label: 'Data',
              ),
              SlidableAction(
                onPressed: (context) => () {},
                //  (HiveDataBase().starNote(
                // widget.note,
                // widget.note.isThisStar,
                // )),

                backgroundColor: const Color.fromARGB(255, 233, 242, 61),
                foregroundColor: Colors.white,
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => EditTask(widget.note),
            //   ),
            // );
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
          subtitle: const Text('data'),
          // boolCheckDeaadline(widget.note.deadlineTime)
          //     ? (widget.note.remindTime == widget.note.deadlineTime
          //         ? const Text('')
          //         : Text(
          //             TimeOfDay.fromDateTime(
          //                     widget.note.remindTime ?? DateTime.now())
          //                 .toString(),
          //             // style: TextStyle(
          //             //     color:
          //             //         // checkIsReplayTimeDeadline(widget.note.replayTime1)
          //             //         //     ? Colors.black
          //             //         //:
          //             //         Theme.of(context).colorScheme.error)
          //           ))
          //     : Text(
          //         deadlineTask(widget.note.deadlineTime.toString()),
          //         style: TextStyle(
          //             color: isThatDeadlineAsGone(widget.note.deadlineTime)
          //                 ? Colors.black
          //                 : Theme.of(context).colorScheme.error,
          //             fontSize: 12),
          //       ),),
      )
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
                    // HiveDataBase().deleteNote(widget.note);
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
      // showCorrectTextInTaskContainer(widget.note.description),
      widget.note.id.toString(),
      maxLines: 1,
      style: const TextStyle(
          fontSize: 25),
    );
  }
}
