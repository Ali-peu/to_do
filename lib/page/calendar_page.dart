import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do/data/firestore.dart';
import 'package:to_do/widgets/task_widgets.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

// MediaQuery.of(context).size.height * .60,
class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Column(children: [
          TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(2020, 1, 1),
              lastDay: DateTime(2030, 1, 1)),
        ])
        // StreamBuilder<QuerySnapshot>(
        //     stream: FirebaseDatasource().stream(),
        //     builder: (context, snapshot) {
        //       if (!snapshot.hasData) {
        //         return Center(child: CircularProgressIndicator());
        //       } else {
        //         final noteLists = FirebaseDatasource().getNotes(snapshot);
        //         return ListView.builder(
        //             itemBuilder: (context, index) {
        //               final note = noteLists[index];

        //               return TaskWidget(note);
        //             },
        //             itemCount: noteLists.length);
        //       }
        //     }),
        //   ]),
        // );
        );
  }
}
