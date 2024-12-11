import 'package:flutter/foundation.dart';

class ThemeProviderForWord with ChangeNotifier {
  String _category = 'All';

  String get category => _category;

  void changeWord(String choiseWord) {
    _category = choiseWord;
    notifyListeners();
  }
}
