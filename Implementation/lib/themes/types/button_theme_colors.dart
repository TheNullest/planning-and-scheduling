import 'package:flutter/material.dart';

class ButtonThemeColors {
  final Color buttonForegroundColor;
  final Color buttonBackgroundColor;
  final Color buttonHoverdBackgroundColor;
  final Color buttonPressedBackgroundColor;

  ButtonThemeColors(
      {required this.buttonForegroundColor,
      required this.buttonBackgroundColor,
      required this.buttonHoverdBackgroundColor,
      required this.buttonPressedBackgroundColor});

  ButtonThemeColors copyWith({
    Color? buttonForegroundColor,
    Color? buttonBackgroundColor,
    Color? buttonHoverdBackgroundColor,
    Color? buttonPressedBackgroundColor,
  }) =>
      ButtonThemeColors(
        buttonForegroundColor:
            buttonForegroundColor ?? this.buttonForegroundColor,
        buttonBackgroundColor:
            buttonBackgroundColor ?? this.buttonBackgroundColor,
        buttonHoverdBackgroundColor:
            buttonHoverdBackgroundColor ?? this.buttonHoverdBackgroundColor,
        buttonPressedBackgroundColor:
            buttonPressedBackgroundColor ?? this.buttonPressedBackgroundColor,
      );

  ButtonThemeColors lerp(ButtonThemeColors? other, t) => other == null
      ? this
      : ButtonThemeColors(
          buttonBackgroundColor: Color.lerp(
              buttonBackgroundColor, other.buttonBackgroundColor, t)!,
          buttonHoverdBackgroundColor: Color.lerp(buttonHoverdBackgroundColor,
              other.buttonHoverdBackgroundColor, t)!,
          buttonPressedBackgroundColor: Color.lerp(buttonPressedBackgroundColor,
              other.buttonPressedBackgroundColor, t)!,
          buttonForegroundColor: Color.lerp(
              buttonForegroundColor, other.buttonForegroundColor, t)!,
        );
}
