import 'dart:async';

import 'package:circle_checkbox/redev_checkbox.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:to_do/data/hive/hive_data.dart';
import 'package:to_do/data/hive/note_category_data.dart';
import 'package:to_do/global/theme.dart';
import 'package:to_do/global/validador_text.dart';
import 'package:to_do/model/category_note.dart';
import 'package:to_do/model/note.dart';
import 'package:to_do/page/category_edit.dart';
import 'package:to_do/page/notifier.dart';
import 'package:to_do/widgets/task_widgets.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

enum PopUpMenu { search, sort, editCategory, deleteAll }

class _TaskPageState extends State<TaskPage> {
  ThemeProvider notifier = ThemeProvider();
  // String chooseCategory = 'All';

  final notesBox = Hive.box<Note>('box');
  final box = Hive.box<CategoryNote>('boxCategory');
  List<CategoryNote> categoryListNote = [];

  List<String> sortVariable = [
    'Срок и время',
    'По алфавиту от А до Я',
    'По алфавиту от Я-А',
    'Вручную(длинительное нажатие для сортировки)'
  ];
  String selectedSortValue = 'Вручную(длинительное нажатие для сортировки)';
  bool? sortValueChoise = false;

  void setSelectedSortValue(String value) {
    setState(() => selectedSortValue = value);
  }

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    HiveCategoryDataBase().initBoxCategory();
    categoryListNote = box.values.toList();

    notesBox.watch().listen((event) {
      if (mounted) {
        setState(() {}); // Обновляет экран не удалять
      }
    });
    box.watch().listen((event) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  PopUpMenu? selectedMenu;

  int currentIndex1 = 0;
  int currentIndex2 = 0;
  int currentIndex3 = 0;
  int currentIndex4 = 0;
  TextEditingController taskText = TextEditingController();

  void pushToEditCategory() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Editcategory(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: Scaffold(appBar: buildAppBar(), body: buildTaskList(notesBox)));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: SingleChildScrollView(
        // Скролиться только в андроид
        primary: false,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          verticalDirection: VerticalDirection.up,
          children: categoryListNote
              .map((category) => buildCategoryButton(category.category))
              .skip(1) // (Пропускаю первое Добавить категорию!№)
              .toList(),
        ),
      ),
      actions: [popUpMenuFromAppBar()],
    );
  }

  Widget buildCategoryButton(String category) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          notifier.changeWord(category);
          setState(() {
            // chooseCategory = category;
            // notifier.changeWord(category);
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        ),
        child: Text(category),
      ),
    );
  }

  Widget buildTaskList(Box<Note> box) {
    List<Note> taskList = box.values
        .where((element) => isTaskInCategory(element, notifier.category))
        .toList();

    List<Note> today = taskList.where((element) => isToday(element)).toList();
    List<Note> past = taskList.where((element) => isPastTask(element)).toList();
    List<Note> future =
        taskList.where((element) => isFutureTask(element)).toList();
    List<Note> todayAndDone =
        taskList.where((element) => isTodayAndDone(element)).toList();

    // setState(() { не нужен вроде
    //   taskList;
    //   today;
    //   past;
    //   future;
    //   todayAndDone;
    // });
    sortingList(selectedSortValue, today);
    sortingList(selectedSortValue, past);
    sortingList(selectedSortValue, future);
    sortingList(selectedSortValue, todayAndDone);

    if (taskList.isEmpty) {
      return const Center(child: Text('Нет задач'));
    } else {
      return ListView(
        children: [
          buildExpansionTile('Past', past, currentIndex1),
          buildExpansionTile('Today', today, currentIndex2),
          buildExpansionTile('Future', future, currentIndex3),
          buildExpansionTile('Tasks done today', todayAndDone, currentIndex4),
        ],
      );
    }
  }

  Widget buildExpansionTile(
      String title, List<Note> taskList, int currentIndex1) {
    setState(() {
      taskList; //НАДО ли тут обновлять?
    });
    return Visibility(
      visible: taskList.isNotEmpty,
      child: ExpansionTile(
        controller: ExpansionTileController(),
        initiallyExpanded: true,
        onExpansionChanged: (bool value) {
          setState(() {
            currentIndex1 = value ? 0 : 1; // Проверить работает ли?
          });
        },
        shape: const Border(),
        title: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 25),
        ),
        // trailing: const Visibility(visible: false, child: Text('')),
        children: taskList.map<Widget>((note) => TaskWidget(note)).toList(),
      ),
    );
  }

  PopupMenuButton<PopUpMenu> popUpMenuFromAppBar() {
    return PopupMenuButton<PopUpMenu>(
      icon: const Icon(Icons.settings),
      initialValue: selectedMenu,
      // Callback that sets the selected popup menu item.
      onSelected: (PopUpMenu item) {
        setState(() {
          selectedMenu = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<PopUpMenu>>[
        PopupMenuItem<PopUpMenu>(
          value: PopUpMenu.search,
          onTap: () {
            showSearch(context: context, delegate: MySearchDelegate());
          },
          child: const Text('Поиск'),
        ),
        PopupMenuItem<PopUpMenu>(
            value: PopUpMenu.sort,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: MediaQuery.sizeOf(context).height * 0.62,
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Задачи отсортированы по',
                                  ),
                                ),
                              ),
                              Flexible(
                                child: ListView.builder(
                                  itemCount: sortVariable.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(sortVariable[index]),
                                      ),
                                      leading: CircleCheckbox(
                                        value: sortValueChoise,
                                        onChanged: (newValue) {
                                          setState(() {
                                            sortValueChoise = newValue;
                                          });
                                          setSelectedSortValue(
                                              sortVariable[index]);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextButton(
                                    child: const Text(
                                      'Выбор',
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              )
                            ],
                          )),
                    );
                  });
            },
            child: const Text('Сортировка')),
        PopupMenuItem<PopUpMenu>(
          value: PopUpMenu.editCategory,
          onTap: pushToEditCategory,
          child: const Text('Редактировать категории'),
        ),
        PopupMenuItem<PopUpMenu>(
          value: PopUpMenu.deleteAll,
          onTap: () {
            unawaited(HiveDataBase().deleteAll());
          },
          child: const Text('Удалить все задании'),
        ),
      ],
    );
  }

  void sortingList(String sortValue, List<Note> noteList) {
    switch (sortValue) {
      case 'Срок и время':
        noteList.sort((a, b) => a.time.compareTo(b.time));
        break;
      case 'По алфавиту от А до Я':
        noteList.sort((a, b) =>
            a.description.toLowerCase().compareTo(b.description.toLowerCase()));
        break;
      case "По алфавиту от Я-А":
        noteList.sort((a, b) =>
            b.description.toLowerCase().compareTo(a.description.toLowerCase()));
        break;
      case 'Вручную(длинительное нажатие для сортировки)':
        noteList;
        break;
      default:
        noteList;
    }
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

class MySearchDelegate extends SearchDelegate {
  final box = Hive.box<Note>('box');

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(
        Icons.arrow_back,
      ));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              query = '';
            },
            icon: const Icon(
              Icons.clear,
            ))
      ];

  @override
  Widget buildResults(BuildContext context) {
    return ListView(
        //taskList.map<Widget>((note) => TaskWidget(note)).toList(),
        children: box.values
            .where((element) =>
                element.description.toLowerCase().contains(query.toLowerCase()))
            .toList()
            .map<Widget>((note) => TaskWidget(note))
            .toList());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
        //taskList.map<Widget>((note) => TaskWidget(note)).toList(),
        children: box.values
            .where((element) =>
                element.description.toLowerCase().contains(query.toLowerCase()))
            .toList()
            .map<Widget>((note) => TaskWidget(note))
            .toList());
  }
}
