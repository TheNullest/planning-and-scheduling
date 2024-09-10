import 'package:flutter/material.dart';

class TextButtonThemeColors {
  final Color textButtonColor;
  final Color textButtonHoveredColor;
  final Color textButtonPressedColor;

  TextButtonThemeColors(
      {required this.textButtonColor,
      required this.textButtonHoveredColor,
      required this.textButtonPressedColor});

  TextButtonThemeColors copyWith(
          {Color? textButtonColor,
          Color? textButtonHoveredColor,
          Color? textButtonPressedColor}) =>
      TextButtonThemeColors(
          textButtonColor: textButtonColor ?? this.textButtonColor,
          textButtonHoveredColor:
              textButtonHoveredColor ?? this.textButtonHoveredColor,
          textButtonPressedColor:
              textButtonPressedColor ?? this.textButtonPressedColor);

  TextButtonThemeColors lerp(TextButtonThemeColors? other, t) => other == null
      ? this
      : TextButtonThemeColors(
          textButtonColor:
              Color.lerp(textButtonColor, other.textButtonColor, t)!,
          textButtonHoveredColor: Color.lerp(
              textButtonHoveredColor, other.textButtonHoveredColor, t)!,
          textButtonPressedColor: Color.lerp(
              textButtonPressedColor, other.textButtonPressedColor, t)!,
        );
}
