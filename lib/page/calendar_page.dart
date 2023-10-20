import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do/data/firestore.dart';
import 'package:to_do/widgets/task_widget_for_calendar_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

// MediaQuery.of(context).size.height * .60,
class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime(2023, 10, 19);
  DateTime _focusedDay = DateTime.now();
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
            });
          },
          selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
        ),
        Flexible(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseDatasource().stream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final noteLists = FirebaseDatasource()
                      .geSelectedTimeNotes(snapshot, _focusedDay);

                  if (noteLists.isEmpty) {
                    return Center(
                      child: Text(
                        'У вас нету задания на эту дату',
                        style: TextStyle(color: Colors.blue[200], fontSize: 30),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final note = noteLists[index];

                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TaskWidgetForCalendar(note),
                        );
                      },
                      itemCount: noteLists.length,
                    );
                  }
                }
              }),
        ),
      ],
    );
  }
}
