// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
// import 'package:to_do/global/theme.dart';
// import 'package:to_do/domain/model/category_note.dart';

// import 'package:to_do/domain/model/note.dart';
// import 'package:to_do/future/account_page/account_page.dart';

// import 'package:to_do/future/another_futures/add_task_with_plus.dart';
// import 'package:to_do/future/another_futures/app_theme_change_page.dart';
// import 'package:to_do/future/calendar_page/calendar_page.dart';
// import 'package:to_do/future/another_futures/notifier.dart';
// import 'package:to_do/future/star_notes/star_notes.dart';
// import 'package:to_do/future/task_page/task_page.dart';
// import 'package:to_do/future/widgets/universal_text_field.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();

//     noteBox.watch().listen((event) {
//       if (mounted) {
//         setState(() {});
//       }
//     });
//     box.watch().listen((event) {
//       if (mounted) {
//         setState(() {});
//       }
//     });
//     pageController = PageController(initialPage: 0);
//   }

//   int iconControllerToCahange = 1;
//   final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

//   int _selectedIndex = 0;
//   PageController pageController = PageController();

//   void onTappedBottomNavigator(int index) {
//     if (index == 0) {
//       _drawerKey.currentState?.openDrawer();
//     } else {
//       setState(() {
//         _selectedIndex =
//             index - 1; // Уменьшите индекс из за того что drawer нету в PageView
//         pageController.jumpToPage(_selectedIndex);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ThemeProviderForWord(),
//       child: Scaffold(
//         // SafeArea поискать, также отменить появление  floatingAxtionButton в AccountPage
//         key: _drawerKey,
//         resizeToAvoidBottomInset: true,
//         body: PageView(
//           controller: pageController,
//           pageSnapping: false,
//           children: const [TaskPage(), CalendarPage(), AccountPage()],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           showUnselectedLabels: true,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Drawer"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.format_list_bulleted_add), label: "Tasks"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.calendar_month_outlined), label: 'Calendar'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.account_box), label: 'Login'),
//           ],
//           currentIndex: _selectedIndex + 1,
//           onTap: onTappedBottomNavigator,
//         ),
//         drawer: drawer(),
//         floatingActionButton: Visibility(
//           visible: _selectedIndex == 2 ? false : true,
//           child: FloatingActionButton(
//             onPressed: () {
//               _displayBottomSheet(context);
//             },
//             child: const Icon(Icons.add),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget drawer() {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           const DrawerHeader(
//             decoration: BoxDecoration(),
//             child: Text(
//               'Drawer Header',
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const StarNotePages()));
//             },
//             child: const ListTile(
//               leading: Icon(Icons.star),
//               title: Text('Звездные задачи'),
//             ),
//           ),
//           myExpansionTile(),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const AppThemeChange()));
//             },
//             child: const ListTile(
//               leading: Icon(Icons.cabin_rounded),
//               title: Text('Темы'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future _displayBottomSheet(BuildContext context) {
//     return showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
//       ),
//       builder: (context) {
//         return const SafeArea(
//             // Обернуть в SafeArea
//             child: AddTask());
//       },
//     );
//   }

//   Widget myExpansionTileElements(CategoryNote categoryNote) {
//     TextEditingController categotyCantoller = TextEditingController();
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//       child: GestureDetector(
//         onTap: () {
//           if (categoryNote.id == 0) {
//             showAlertDialog(context, categotyCantoller, box);
//           } else {
//             Provider.of<ThemeProvider>(context, listen: true)
//                 .changeWord(categoryNote.category);

//             // context
//             //     .read<ThemeProviderForWord>()
//             //     .changeWord(categoryNote.category);
//           }
//         },
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 categoryNote.category,
//               ),
//             ),
//             Text(noteBox.values
//                 .where((element) => element.category == categoryNote.category)
//                 .toList()
//                 .length
//                 .toString()),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget myExpansionTile() {
//     return ExpansionTile(
//       title: const Text("Категории"),
//       children: box.values
//           .toList()
//           .map<Widget>((element) => myExpansionTileElements(element))
//           .toList(),
//     );
//   }
// }
