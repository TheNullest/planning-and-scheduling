import 'package:flutter/material.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color backgroundColor;
  final Color sectionColor;
  final Color textFieldBackgroundColor;
  final Color textFieldForegroundColor;
  final Color textFieldHintColor;
  final Color textFieldCursorColor;
  final Color textFieldEnabledBorderColor;
  final Color textFieldFocusedBorderColor;
  final Color sectionBorderColor;
  final Color buttonBackgroundColor;
  final Color buttonForegroundColor;
  final Color shadowOnBackgroundColor;
  final Color shadowOnSurfaceColor;
  final Color selectedTabColor;
  final Color unSelectedTabColor;
  final Color iconShadowColor;
  final Color errorTextColor;
  final Color errorFieldColor;

  CustomThemeExtension({
    required this.backgroundColor,
    required this.sectionColor,
    required this.textFieldBackgroundColor,
    required this.textFieldHintColor,
    required this.textFieldCursorColor,
    required this.textFieldForegroundColor,
    required this.textFieldEnabledBorderColor,
    required this.textFieldFocusedBorderColor,
    required this.sectionBorderColor,
    required this.buttonBackgroundColor,
    required this.buttonForegroundColor,
    required this.shadowOnBackgroundColor,
    required this.shadowOnSurfaceColor,
    required this.selectedTabColor,
    required this.unSelectedTabColor,
    required this.iconShadowColor,
    required this.errorTextColor,
    required this.errorFieldColor,
  });

  @override
  CustomThemeExtension copyWith({
    Color? backgroundColor,
    Color? sectionColor,
    Color? textFieldBackgroundColor,
    Color? textFieldHintColor,
    Color? textFieldCursorColor,
    Color? textFieldForegroundColor,
    Color? textFieldEnabledBorderColor,
    Color? textFieldFocusedBorderColor,
    Color? sectionBorderColor,
    Color? buttonBackgroundColor,
    Color? buttonForegroundColor,
    Color? shadowOnBackgroundColor,
    Color? shadowOnSurfaceColor,
    Color? selectedTabColor,
    Color? unSelectedTabColor,
    Color? iconShadowColor,
    Color? errorTextColor,
    Color? errorFieldColor,
  }) {
    return CustomThemeExtension(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      sectionColor: sectionColor ?? this.sectionColor,
      textFieldForegroundColor:
          textFieldForegroundColor ?? this.textFieldForegroundColor,
      textFieldBackgroundColor:
          textFieldBackgroundColor ?? this.textFieldBackgroundColor,
      textFieldHintColor: textFieldHintColor ?? this.textFieldHintColor,
      textFieldCursorColor: textFieldCursorColor ?? this.textFieldCursorColor,
      textFieldFocusedBorderColor:
          textFieldFocusedBorderColor ?? this.textFieldFocusedBorderColor,
      textFieldEnabledBorderColor:
          textFieldEnabledBorderColor ?? this.textFieldEnabledBorderColor,
      sectionBorderColor: sectionBorderColor ?? this.sectionBorderColor,
      buttonBackgroundColor:
          buttonBackgroundColor ?? this.buttonBackgroundColor,
      buttonForegroundColor:
          buttonForegroundColor ?? this.buttonForegroundColor,
      shadowOnBackgroundColor:
          shadowOnBackgroundColor ?? this.shadowOnBackgroundColor,
      shadowOnSurfaceColor: shadowOnSurfaceColor ?? this.shadowOnSurfaceColor,
      selectedTabColor: selectedTabColor ?? this.selectedTabColor,
      unSelectedTabColor: unSelectedTabColor ?? this.unSelectedTabColor,
      iconShadowColor: iconShadowColor ?? this.iconShadowColor,
      errorTextColor: errorTextColor ?? this.errorTextColor,
      errorFieldColor: errorFieldColor ?? this.errorFieldColor,
    );
  }

  @override
  CustomThemeExtension lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;

    return CustomThemeExtension(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      sectionColor: Color.lerp(sectionColor, other.sectionColor, t)!,
      textFieldForegroundColor: Color.lerp(
          textFieldForegroundColor, other.textFieldForegroundColor, t)!,
      textFieldBackgroundColor: Color.lerp(
          textFieldBackgroundColor, other.textFieldBackgroundColor, t)!,
      textFieldHintColor:
          Color.lerp(textFieldHintColor, other.textFieldHintColor, t)!,
      textFieldCursorColor:
          Color.lerp(textFieldCursorColor, other.textFieldCursorColor, t)!,
      textFieldEnabledBorderColor: Color.lerp(
          textFieldEnabledBorderColor, other.textFieldEnabledBorderColor, t)!,
      textFieldFocusedBorderColor: Color.lerp(
          textFieldFocusedBorderColor, other.textFieldFocusedBorderColor, t)!,
      sectionBorderColor:
          Color.lerp(sectionBorderColor, other.sectionBorderColor, t)!,
      buttonBackgroundColor:
          Color.lerp(buttonBackgroundColor, other.buttonBackgroundColor, t)!,
      buttonForegroundColor:
          Color.lerp(buttonForegroundColor, other.buttonForegroundColor, t)!,
      shadowOnBackgroundColor: Color.lerp(
          shadowOnBackgroundColor, other.shadowOnBackgroundColor, t)!,
      shadowOnSurfaceColor:
          Color.lerp(shadowOnSurfaceColor, other.shadowOnSurfaceColor, t)!,
      selectedTabColor:
          Color.lerp(selectedTabColor, other.selectedTabColor, t)!,
      unSelectedTabColor:
          Color.lerp(unSelectedTabColor, other.unSelectedTabColor, t)!,
      iconShadowColor: Color.lerp(iconShadowColor, other.iconShadowColor, t)!,
      errorTextColor: Color.lerp(errorTextColor, other.errorTextColor, t)!,
      errorFieldColor: Color.lerp(errorFieldColor, other.errorFieldColor, t)!,
    );
  }
}
