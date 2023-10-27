import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:to_do/model/note.dart';
import 'package:to_do/widgets/task_widget_for_calendar_page.dart';
import 'package:to_do/widgets/task_widgets.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  Future<Box<Note>> listTask = Hive.openBox<Note>('box');

  @override
  void initState() {
    super.initState();

    listTask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            child: TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime(2020, 1, 1),
              lastDay: DateTime(2030, 1, 1),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            ),
          ),
          Flexible(
            child: FutureBuilder(
                future: listTask,
                initialData: Hive.box<Note>('box'),
                builder: (BuildContext context, AsyncSnapshot<Box<Note>> box) {
                  if (box.data == null || box.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        'У вас нет задач на этот день',
                        style: TextStyle(color: Colors.teal),
                      ),
                    );
                  } else {
                    List<Note> dateNotes = box.data!.values
                        .where((element) =>
                            DateUtils.dateOnly(element.time) ==
                            DateUtils.dateOnly(_focusedDay))
                        .toList();

                    return ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TaskWidgetForCalendar(dateNotes[index]),
                        );
                      },
                      itemCount: dateNotes.length,
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
