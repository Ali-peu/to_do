import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:to_do/auth/main_page.dart';
import 'package:to_do/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // await Hive.openBox('to_do_box');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPageForDetermine(),
    );
  }
}
