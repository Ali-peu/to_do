import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/data/hive/hive_data.dart';
import 'package:to_do/firebase_options.dart';
import 'package:to_do/global/app_colors.dart';
import 'package:to_do/global/notification_app.dart';
import 'package:to_do/model/category_adapter.dart';
import 'package:to_do/model/category_note.dart';
import 'package:to_do/model/note.dart';
import 'package:to_do/model/note_adapter.dart';
import 'package:to_do/page/home.dart';

import 'package:timezone/data/latest.dart' as tz;

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

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          
          
          splashFactory: NoSplash.splashFactory,
          cardColor: StyleApp().appColor,
          canvasColor: StyleApp().appColor,
          appBarTheme: AppBarTheme(elevation: 0.0, color: StyleApp().appColor),
          focusColor: StyleApp().inActiveWidgetsColor),
      home: const MyHomePage(),
    );
  }
}
