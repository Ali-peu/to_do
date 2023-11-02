import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:to_do/model/note.dart';
import 'package:to_do/page/account_page.dart';

import 'package:to_do/page/add_task_with_plus.dart';
import 'package:to_do/page/calendar_page.dart';
import 'package:to_do/page/task_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Hive.box<Note>('box');
  }

  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTappedBottomnavigator(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.23;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: PageView(
        controller: pageController,
        children: const [TaskPage(), CalendarPage(), AccountPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_add), label: "Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: 'Login'),
        ],
        currentIndex: _selectedIndex,
        onTap: onTappedBottomnavigator,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displayBottomSheet(context, height);
        },
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context, double height) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        builder: (context) => Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            height: height,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            child: const AddTask()));
  }
}
