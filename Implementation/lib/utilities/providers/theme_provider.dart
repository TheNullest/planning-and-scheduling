import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/themes/themes.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    toggleTheme();
  }

  late String selectedMode;
  ThemeData _themeData = lightTheme;
  ThemeData get themeData => _themeData;

  /// Returns the customized theme that can choice colors
  CustomThemeExtension myTheme(context) =>
      Theme.of(context).extension<CustomThemeExtension>()!;

  bool get isDarkMode => _themeData == darkTheme;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    selectedMode = isDarkMode ? 'Dark Mode' : 'Light Mode';
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightTheme) {
      themeData = darkTheme;
    } else {
      themeData = lightTheme;
    }
  }

  ThemeData currentTheme(context) =>
      Provider.of<ThemeProvider>(context).themeData;
}
