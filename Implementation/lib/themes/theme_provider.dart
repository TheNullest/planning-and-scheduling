import 'package:flutter/material.dart';
import 'package:zamaan/themes/themes.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    toggleTheme();
  }

  late String selectedMode;
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    selectedMode = isDarkMode ? 'Dark Mode' : 'Light Mode';
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
