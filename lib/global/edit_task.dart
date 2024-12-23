import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:to_do/data/drift_datebase_providers/drift_database_provider_for_note.dart';

import 'package:to_do/domain/model/note.dart';
import 'package:to_do/future/another_futures/timer_in_edit_task.dart';
import 'package:timezone/timezone.dart' as tz;

enum SampleItem { itemOne, itemTwo, itemThree, itemFourth }

class EditTask extends StatefulWidget {
  final NoteModel _note;
  const EditTask(this._note, {super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  tz.Location local = tz.local;
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    local = tz.getLocation('Asia/Almaty');

    taskText = TextEditingController(text: widget._note.description);
  }

  TextEditingController? taskText;
  FocusNode focusNode = FocusNode();
  void _showSnackbar() {
    Fluttertoast.showToast(
        msg: 'Обновление не может быть пустым', gravity: ToastGravity.SNACKBAR);
  }

  TimeOfDay timeOfDay = TimeOfDay.now();

  late TimeOfDay timeOfDayToNotification = TimeOfDay.now();
  SampleItem? selectedMenu;

  void pushToTimer() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyTimer(),
        ));
  }

  void changeNoteStatus() {
    unawaited(Provider.of<DriftDatebaseProviderForNote>(context, listen: false)
        .updateNoteInDB(model: widget._note));
  }

  void deleteNote() {
    unawaited(Provider.of<DriftDatebaseProviderForNote>(context, listen: false)
        .deleteNoteFromDB(id: widget._note.id));
    Navigator.pop(context);
  }

  void shareNote() {
    Fluttertoast.showToast(msg: 'Пока не знаю как');
  }

  DateTime? updateTime;
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: widget._note.deadlineTime,
      firstDate: DateTime(2023, 01, 01),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        if (value != null) {
          changeNoteStatus();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget._note.isDone
          ? Colors.grey[300]
          : Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
          backgroundColor: widget._note.isDone
              ? Colors.grey[300]
              : Theme.of(context).scaffoldBackgroundColor,
          leading: iconButtonToBack(context),
          actions: [popUpMenuFromAppBar()]),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(children: [
                taskTextforEdit(),
                const Divider(),
                // editDate(),
                const Divider(),
                // rington(),
                if (widget._note.remindTime != widget._note.deadlineTime)
                  Column(
                    children: [
                      replayTime('напоминание в',
                          widget._note.remindTime ?? DateTime.now()),
                      replayTime2('Тип напоминание', 'Уведомление')
                    ],
                  ),
                const Divider(),
                someThing()
              ]))),
    );
  }

  PopupMenuButton<SampleItem> popUpMenuFromAppBar() {
    return PopupMenuButton<SampleItem>(
      icon: const Icon(Icons.settings),
      initialValue: selectedMenu,
      // Callback that sets the selected popup menu item.
      onSelected: (SampleItem item) {
        setState(() {
          selectedMenu = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          onTap: pushToTimer,
          child: const Text('Таймер'),
        ),
        PopupMenuItem<SampleItem>(
            value: SampleItem.itemTwo,
            onTap: changeNoteStatus,
            child: widget._note.isDone
                ? const Text('Отметить как невыполненное')
                : const Text('Отметить как выполненное')),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          onTap: deleteNote,
          child: const Text('Удалить'),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemFourth,
          onTap: shareNote,
          child: const Text('Поделиться'),
        ),
      ],
    );
  }

  InkWell replayTime(String type, DateTime subType) {
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
                child: Text(
                  type,
                ),
              ),
            ),
            Text(
              TimeOfDay.fromDateTime(subType).toString(),
            ),
          ],
        ),
      ),
    );
  }

  InkWell replayTime2(String type, String subType) {
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
                child: Text(
                  type,
                ),
              ),
            ),
            Text(
              subType,
            ),
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
            Icon(Icons.repeat),
            Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Повторить задание",
                ),
              ),
            ),
            Text('Нет'),
          ],
        ),
      ),
    );
  }

  // InkWell rington() {
  //   return InkWell(
  //     onTap: () async {
  //       TimeOfDay? timeToPick = await showTimePicker(
  //           context: context,
  //           initialTime: timeOfDay,
  //           initialEntryMode: TimePickerEntryMode.dialOnly);
  //       if (timeToPick == null) return;
  //       setState(() {
  //         // починить что то сделал сам не понял

  //         timeOfDayToNotification = subtractMinutes(timeToPick, 5);
  //         var timeToPickDate = DateTime(
  //             widget._note.time.year,
  //             widget._note.time.month,
  //             widget._note.time.day,
  //             timeToPick.hour,
  //             timeToPick.minute);
  //         var timeToPickDate2 = DateTime(
  //             widget._note.time.year,
  //             widget._note.time.month,
  //             widget._note.time.day,
  //             timeToPick.hour,
  //             timeToPick.minute - 5);
  //         unawaited(
  //             HiveDataBase().updateReplayTime(widget._note, timeToPickDate));
  //         unawaited(
  //             HiveDataBase().updateReplayTime2(widget._note, timeToPickDate2));
  //         dateTime = DateTime(
  //             DateTime.now().year,
  //             DateTime.now().month,
  //             DateTime.now().day,
  //             timeOfDayToNotification.hour,
  //             timeOfDayToNotification.minute);
  //       });
  //       NotificationApi.showScheduleNotification(
  //           title: "Schedule Notification",
  //           body: "This is a Schedule Notification",
  //           payload: "This is schedule data",
  //           datetime: dateTime,
  //           local: local);
  //     },
  //     child: SizedBox(
  //       height: 60,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           const Icon(Icons.access_time),
  //           const Flexible(
  //             child: Align(
  //               alignment: Alignment.centerLeft,
  //               child: Text(
  //                 'Время & Напоминание',
  //               ),
  //             ),
  //           ),
  //           Text(
  //             widget._note.replayTime1 == widget._note.time
  //                 ? "Нет"
  //                 : TimeOfDay.fromDateTime(widget._note.replayTime1).toString(),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // InkWell editDate() {
  //   return InkWell(
  //     onTap: () async {
  //       updateTime = await MyCustomCalendar().showCustomDatePickerPac(context);
  //       setState(() {
  //         updateTime;
  //       });
  //       HiveDataBase()
  //           .updateDatetime(widget._note, updateTime ?? widget._note.time);

  //       HiveDataBase().updateReplayTime(widget._note, dateTime);
  //     },
  //     child: SizedBox(
  //       height: 60,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           const Icon(
  //             Icons.calendar_month_outlined,
  //           ),
  //           const Flexible(
  //             child: Align(
  //               alignment: Alignment.centerLeft,
  //               child: Text(
  //                 "Срок по задаче",
  //               ),
  //             ),
  //           ),
  //           Container(
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
  //             child: Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Text(
  //                   dateTimeDeleteSeconds(widget._note.time.toString()),
  //                 )),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget taskTextforEdit() {
    return TextField(
      autofocus: true,
      maxLines: 7,
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
      onPressed: () {
        if (taskText!.text.isEmpty) {
          return _showSnackbar();
        }
        changeNoteStatus();
        // unawaited().update(widget._note, taskText!.text));
        Navigator.pop(context);
      },
    );
  }
}
