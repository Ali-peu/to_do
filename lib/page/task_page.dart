import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:to_do/data/firestore.dart';

import 'package:to_do/widgets/task_widgets.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TextEditingController taskText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseDatasource().stream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              final noteLists = FirebaseDatasource().getNotes(snapshot);
              return ListView.builder(
                  itemBuilder: (context, index) {
                    final note = noteLists[index];

                    return Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          color: Colors.red,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: AlignmentDirectional.centerStart,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        secondaryBackground: Container(
                          color: Colors.amber[700],
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: AlignmentDirectional.centerEnd,
                          child: const Icon(
                            Icons.archive,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (direction) {
                          FirebaseDatasource().deleteTask(note.id);
                        },
                        child: TaskWidget(note));
                  },
                  itemCount: noteLists.length);
            }
          }),
    );
  }
}
