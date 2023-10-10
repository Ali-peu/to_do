import 'package:flutter/material.dart';

import 'package:to_do/page/add_task_with_plus.dart';
import 'package:to_do/page/calendar_page.dart';
import 'package:to_do/page/task_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          TaskPage(),
          CalendarPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_add), label: "Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: 'Calendar')
        ],
        selectedItemColor: Colors.blue.shade900,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey.shade700,
        onTap: onTappedBottomnavigator,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddTask(),
          ));
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, size: 30),
      ),
    );
  }
}
