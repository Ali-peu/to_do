import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/global/theme.dart';
import 'package:to_do/global/theme_app.dart';

class AppThemeChange extends StatelessWidget {
  // Темно-синяя тема

  const AppThemeChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Theme'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 30,
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Row(
        children: [
          appThemeBox(context, AppTheme.pinkTheme, 'Light'),
          appThemeBox(context, AppTheme.darkTheme, 'Dark'),
          appThemeBox(context, AppTheme.lightTheme, 'Blue'),
        ],
      ),
    );
  }

  Widget appThemeBox(
      BuildContext context, ThemeData themeData, String themeName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: SizedBox(
          height: 100,
          width: 100,
          child: ColoredBox(color: themeData.colorScheme.background),
        ),
        onTap: () {
          Provider.of<ThemeProvider>(context, listen: false)
              .setTheme(themeData);
        },
      ),
    );
  }
}
