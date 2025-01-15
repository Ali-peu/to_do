import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:to_do/configuration/dependencies/app_dependencies.dart';
import 'package:to_do/data/router/app_router.dart';

import 'package:to_do/global/notification_app.dart';
import 'package:to_do/global/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationApi.init();

  await NotificationApi.init();

  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
        providers: appDependencies,
        child: MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            theme: themeProvider.themeData));
  }
}
