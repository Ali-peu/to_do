import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/global/validador_text.dart';

import 'package:to_do/model/note.dart';

import 'package:to_do/widgets/task_widgets.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  ScrollController scrollController = ScrollController();
  String chooseCategory = 'All';
  Future<Box<Note>> boxListTask = Hive.openBox<Note>('box');

  List<Note> noteList = <Note>[];

  Box<Note> openBox() {
    return Hive.box<Note>('box');
  }

  void getTask() async {
    noteList = openBox().values.toList();
    if (mounted) {
      setState(() {
        noteList;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    boxListTask;

    // Создайте слушателя для бокса Hive
    openBox().watch().listen((event) {
      getTask(); // Обновите noteList при изменениях
    });
  }

  TextEditingController taskText = TextEditingController();
  ExpansionTileController controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            elevatedCategoryButtonInAppBar('All'),
            elevatedCategoryButtonInAppBar('Study'),
            elevatedCategoryButtonInAppBar('Work'),
          ],
        ),
      ),
      body: FutureBuilder(
        future: boxListTask,
        builder: (BuildContext context, AsyncSnapshot<Box<Note>> response) {
          if (!response.hasData) {
            return const Center(
              child: Text('Loading...'),
            );
          } else if (response.data!.length == 0) {
            return const Center(
              child: Text('У вас на сегодня нет задач'),
            );
          } else {
            List<Note> today = response.data!.values
                .where((element) =>
                    boolCheckDeaadline(element.time) && element.isDone == false)
                .toList();
            List<Note> past = response.data!.values
                .where((element) => checkThisIsPastTask(element.time))
                .toList();
            List<Note> future = response.data!.values
                .where((element) => element.time.isAfter(DateTime.now()))
                .toList();

            List<Note> todayAndDone = response.data!.values
                .where((element) =>
                    boolCheckDeaadline(element.time) && element.isDone == true)
                .toList();

            return ListView(
              children: [
                Visibility(
                  visible: past.isEmpty ? false : true,
                  child: ExpansionTile(
                      initiallyExpanded: true,
                      title: const Text('Past'),
                      children: past.map<Widget>((Note note) {
                        return TaskWidget(note);
                      }).toList()),
                ),
                Visibility(
                  visible: today.isEmpty ? false : true,
                  child: ExpansionTile(
                      // shape: null,
                      initiallyExpanded: true,
                      title: const Row(
                        children: [Text("Today"), Icon(Icons.arrow_downward)],
                      ),
                      trailing: const Visibility(
                          visible: false, child: Icon(Icons.h_mobiledata)),
                      children: today.map<Widget>((Note note) {
                        return TaskWidget(note);
                      }).toList()),
                ),
                Visibility(
                  visible: future.isEmpty ? false : true,
                  child: ExpansionTile(
                      initiallyExpanded: true,
                      title: const Text('Future'),
                      children: future.map<Widget>((Note note) {
                        return TaskWidget(note);
                      }).toList()),
                ),
                Visibility(
                  visible: future.isEmpty ? false : true,
                  child: ExpansionTile(
                      initiallyExpanded: true,
                      title: const Text('TodayDoneTasks'),
                      children: todayAndDone.map<Widget>((Note note) {
                        return TaskWidget(note);
                      }).toList()),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  // Padding normalTasksWithoutExpresionTile() {
  //   return Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: ListView.builder(
  //         itemBuilder: ((context, index) {
  //           return TaskWidget(noteList[index]);

  //           // return TaskWidget(noteList[index]);
  //         }),
  //         itemCount: noteList.length,
  //       ));
  // }

  Widget elevatedCategoryButtonInAppBar(String category) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            chooseCategory = category;
            if (chooseCategory == 'All') {
              getTask();
            } else {
              noteList = openBox()
                  .values
                  .where((element) => element.category == category)
                  .toList();
            }
          });
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40)),
        child: Text(
          category,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
