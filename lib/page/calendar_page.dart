import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:to_do/model/note.dart';
import 'package:to_do/widgets/task_widget_for_calendar_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  List<Note> selectedDataNotes = [];

  void getSelectedDateNotes() async {
    final box = Hive.box<Note>('box');
    selectedDataNotes = box.values.where((task) {
      // Фильтрация задач, соответствующих выбранной дате
      return task.time.year == _selectedDay.year &&
          task.time.month == _selectedDay.month &&
          task.time.day == _selectedDay.day;
    }).toList();

    if (mounted) {
      setState(() {
        selectedDataNotes;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getSelectedDateNotes();
    final box = Hive.box<Note>('box');
    box.watch().listen((event) {
      getSelectedDateNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: _focusedDay,
          firstDay: DateTime(2020, 1, 1),
          lastDay: DateTime(2030, 1, 1),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              getSelectedDateNotes(); // Обновляем список задач при выборе дня
            });
          },
          selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
        ),
        Flexible(
          child: selectedDataNotes.isEmpty
              ? const Center(
                  child: Text(
                    'У вас нет задач на этот день',
                    style: TextStyle(color: Colors.teal),
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TaskWidgetForCalendar(selectedDataNotes[index]),
                    );
                  },
                  itemCount: selectedDataNotes.length,
                ),
        ),
      ],
    );
  }
}
