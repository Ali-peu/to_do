import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/global/validador_text.dart';
import 'package:to_do/model/note.dart';
import 'package:to_do/widgets/task_widgets.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  String chooseCategory = 'All';
  final notesBox = Hive.box<Note>('box');

  List<String> category = ['All', 'Study', 'Work'];

  @override
  void initState() {
    super.initState();
    notesBox.watch().listen((event) {
      setState(() {}); // Обновляет экран не удалять
    });
  }

  int currentIndex = 0;
  TextEditingController taskText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: buildTaskList(notesBox));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        children:
            category.map((category) => buildCategoryButton(category)).toList(),
      ),
    );
  }

  Widget buildCategoryButton(String category) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          chooseCategory = category;
        });
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      ),
      child: Text(
        category,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildTaskList(Box<Note> response) {
    List<Note> taskList = response.values
        .where((element) => isTaskInCategory(element, chooseCategory))
        .toList();

    List<Note> today = taskList.where((element) => isToday(element)).toList();
    List<Note> past = taskList.where((element) => isPastTask(element)).toList();
    List<Note> future =
        taskList.where((element) => isFutureTask(element)).toList();
    List<Note> todayAndDone =
        taskList.where((element) => isTodayAndDone(element)).toList();

    setState(() {
      taskList;
      today;
      past;
      future;
      todayAndDone;
    });

    if (taskList.isEmpty) {
      return const Center(child: Text('Нет задач'));
    } else {
      return ListView(
        children: [
          buildExpansionTile('Past', past),
          buildExpansionTile('Today', today),
          buildExpansionTile('Future', future),
          buildExpansionTile('Tasks done today', todayAndDone),
        ],
      );
    }
  }

  Widget buildExpansionTile(String title, List<Note> taskList) {
    setState(() {
      taskList;
    });
    return Visibility(
      visible: taskList.isNotEmpty,
      child: ExpansionTile(
        controller: ExpansionTileController(),
        initiallyExpanded: true,
        onExpansionChanged: (bool value) {
          setState(() {});
        },
        title: Row(
          children: [
            Text(title),
            AbsorbPointer(
              child: IconButton(
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, anim) => RotationTransition(
                    turns: child.key == const ValueKey('icon1')
                        ? Tween<double>(begin: 0, end: 1).animate(anim)
                        : Tween<double>(begin: 1, end: 0).animate(anim),
                    child: FadeTransition(opacity: anim, child: child),
                  ),
                  child: currentIndex == 0
                      ? const Icon(Icons.arrow_drop_down_sharp,
                          key: ValueKey('icon1'))
                      : const Icon(
                          Icons.home, //Icons.arrow_drop_up_sharp
                          key: ValueKey('icon2'),
                        ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        trailing: const Visibility(visible: false, child: Text('')),
        children: taskList.map<Widget>((note) => TaskWidget(note)).toList(),
      ),
    );
  }

  Widget buildExpansionTileIcon(int currentIcon) {
    return IconButton(
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, anim) => RotationTransition(
          turns: child.key == const ValueKey('icon1')
              ? Tween<double>(begin: 0, end: 1).animate(anim)
              : Tween<double>(begin: 1, end: 0).animate(anim),
          child: FadeTransition(opacity: anim, child: child),
        ),
        child: currentIcon == 0
            ? const Icon(Icons.arrow_drop_down_sharp, key: ValueKey('icon1'))
            : const Icon(
                Icons.home, //Icons.arrow_drop_up_sharp
                key: ValueKey('icon2'),
              ),
      ),
      onPressed: () {},
    );
  }

  bool isTaskInCategory(Note note, String category) {
    return category == 'All' || note.category == category;
  }

  bool isToday(Note note) {
    return boolCheckDeaadline(note.time) && !note.isDone;
  }

  bool isPastTask(Note note) {
    return checkThisIsPastTask(note.time);
  }

  bool isFutureTask(Note note) {
    return note.time.isAfter(DateTime.now());
  }

  bool isTodayAndDone(Note note) {
    return boolCheckDeaadline(note.time) && note.isDone;
  }
}
