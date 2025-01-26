import 'package:flutter/material.dart';
import 'package:zamaan/core/config/themes/app_dark_palette.dart';

class AppTheme {
  static OutlineInputBorder _border({
    Color borderColor = AppPallete.enableBorderColor,
  }) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: borderColor,
          width: 3,
        ),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
    chipTheme: const ChipThemeData(
      color: WidgetStatePropertyAll(AppPallete.backgroundColor),
      side: BorderSide.none,
    ),
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(borderColor: AppPallete.focusedBorderColor),
      errorBorder: _border(borderColor: AppPallete.errorColor),
    ),
  );
}
