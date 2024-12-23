import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    // splashFactory: NoSplash.splashFactory,
    focusColor: Colors.blue.shade600,
    primaryColor: Colors.white,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      elevation: 100,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      contentTextStyle: TextStyle(color: Colors.black, fontSize: 15),
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      shape: Border(),
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    navigationBarTheme: const NavigationBarThemeData(
        height: 70,
        indicatorShape: OutlineInputBorder(
          borderSide: BorderSide.none,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.red.shade600,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.amber,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear),
    // Дополнительные стили для других элементов UI
  );

  // static final ThemeData pinkTheme = ThemeData(
  //   colorScheme: const ColorScheme(
  //     primary: Colors.pink,
  //     brightness: Brightness.light,
  //     onPrimary: Colors.black54,
  //     onSurface: Colors.pink,
  //     secondary: Colors.pink,
  //     onSecondary: Colors.pink,
  //     error: Colors.pink,
  //     onError: Colors.pink,
  //     background: Colors.pink,
  //     onBackground: Colors.pink,
  //     surface: Colors.pink,
  //   ),
  //   cardTheme: const CardTheme(
  //     color: Colors.white54,
  //   ),
  //   scaffoldBackgroundColor: Colors.white,
  //   appBarTheme: AppBarTheme(
  //     color: Colors.white,
  //     elevation: 0,
  //     shape: const Border(),
  //     iconTheme: IconThemeData(color: Colors.pink.shade200),
  //     titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
  //   ),

  //   floatingActionButtonTheme: FloatingActionButtonThemeData(
  //     backgroundColor: Colors.pink.shade300,
  //     foregroundColor: Colors.white,
  //   ),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     selectedItemColor: Colors.pink.shade300,
  //     unselectedItemColor: Colors.grey,
  //   ),
  //   // Дополнительные стили для других элементов UI
  // );

  // static final ThemeData darkTheme = ThemeData(
  //   colorScheme: ColorScheme(
  //     primary: Colors.black54,
  //     brightness: Brightness.dark,
  //     onPrimary: Colors.white,
  //     onSurface: Colors.black54,
  //     secondary: Colors.black54,
  //     onSecondary: Colors.blue.shade300,
  //     error: Colors.black54,
  //     onError: Colors.black54,
  //     background: Colors.black54,
  //     onBackground: Colors.black54,
  //     surface: Colors.black54,
  //   ),
  //   scaffoldBackgroundColor: Colors.blueGrey.shade900,
  //   appBarTheme: AppBarTheme(
  //     color: Colors.blueGrey.shade900,
  //     iconTheme: IconThemeData(color: Colors.blue.shade200),
  //     titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
  //   ),
  //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //     backgroundColor: Colors.blue,
  //     foregroundColor: Colors.white,
  //   ),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     selectedItemColor: Colors.blue.shade600,
  //     unselectedItemColor: Colors.blueGrey.shade600,
  //   ),
  //   // Дополнительные стили для других элементов UI
  // );
}
