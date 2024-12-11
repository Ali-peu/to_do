import 'package:flutter/material.dart';
import 'package:to_do/data/theme/theme_app.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = AppTheme.lightTheme; // начальная тема

  ThemeData get themeData => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  String _category = 'All';

  String get category => _category;

  void changeWord(String choiseWord) {
    _category = choiseWord;
    notifyListeners();
  }

  void setstate() {
    notifyListeners();
  }
}
