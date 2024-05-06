import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/themes/custom_theme_extension.dart';
import 'package:zamaan/themes/themes.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    toggleTheme();
  }

  late String selectedMode;
  ThemeData _themeData = lightTheme;
  ThemeData get themeData => _themeData;

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

  static currentTheme(context) => Provider.of<ThemeProvider>(context).themeData;

  /// Returns the customized theme that can choice colors
  static CustomThemeExtension myTheme(context) =>
      Theme.of(context).extension<CustomThemeExtension>()!;
}
