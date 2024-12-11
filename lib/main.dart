import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:to_do/data/router/app_router.dart';
import 'package:to_do/data/theme/theme_app.dart';

import 'package:to_do/global/notification_app.dart';
import 'package:to_do/global/theme.dart';
import 'package:to_do/domain/model/category_adapter.dart';
import 'package:to_do/domain/model/category_note.dart';
import 'package:to_do/domain/model/note.dart';
import 'package:to_do/domain/model/note_adapter.dart';

import 'package:to_do/data/hive/note_category_data.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:to_do/future/another_futures/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationApi.init();

  await Hive.initFlutter();
  tz.initializeTimeZones();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('box');

  Hive.registerAdapter(CategoryAdapter());
  await Hive.openBox<CategoryNote>('boxCategory');
  await NotificationApi.init();
  HiveCategoryDataBase().initBoxCategory();

  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: themeProvider.themeData
        // home: const MyHomePage(),
        );
  }
}
