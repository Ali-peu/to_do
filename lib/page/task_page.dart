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
  ScrollController scrollController = ScrollController();
  String chooseCategory = 'All';

  TextEditingController taskText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Row(
          children: [
            elevatedCategoryButtonInAppBar('All'),
            elevatedCategoryButtonInAppBar('Study'),
            elevatedCategoryButtonInAppBar('Work'),
          ],
        ),
      ),
      body: firestoreNotes(),
    );
  }

  Widget elevatedCategoryButtonInAppBar(String category) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            chooseCategory = category;
          });
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[100],
            disabledBackgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40)),
        child: Text(
          category,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget firestoreNotes() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseDatasource().stream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (chooseCategory == 'All') {
                final noteLists = FirebaseDatasource().getNotes(snapshot);
                return listOfTasks(noteLists);
              } else if (chooseCategory == 'Work') {
                final noteLists =
                    FirebaseDatasource().getCategoryNotes(snapshot, 'Work');
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
                          onDismissed: (direction) {
                            FirebaseDatasource().deleteTask(note.id);
                          },
                          child: TaskWidget(note));
                    },
                    itemCount: noteLists.length);
              } else {
                final noteLists =
                    FirebaseDatasource().getCategoryNotes(snapshot, 'Study');
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
                          onDismissed: (direction) {
                            FirebaseDatasource().deleteTask(note.id);
                          },
                          child: TaskWidget(note));
                    },
                    itemCount: noteLists.length);
              }
            }
          }),
    );
  }

  ListView listOfTasks(List<dynamic> noteLists) {
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
              onDismissed: (direction) {
                FirebaseDatasource().deleteTask(note.id);
              },
              child: TaskWidget(note));
        },
        itemCount: noteLists.length);
  }
}
