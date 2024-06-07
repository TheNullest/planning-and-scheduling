import 'package:flutter/material.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color backgroundColor;
  final Color sectionColor;
  final Color sectionBorderColor;

  final Color textColor;

  final Color textFieldBackgroundColor;
  final Color textFieldForegroundColor;
  final Color textFieldHintColor;
  final Color textFieldCursorColor;
  final Color textFieldEnabledBorderColor;
  final Color textFieldFocusedBorderColor;

  final Color buttonForegroundColor;
  final Color buttonBackgroundColor;
  final Color buttonHoverdBackgroundColor;
  final Color buttonPressedBackgroundColor;

  final Color taskButtonForegroundColor;
  final Color taskButtonBackgroundColor;
  final Color taskButtonHoverdBackgroundColor;
  final Color taskButtonActivatedBackgroundColor;
  final Color taskButtonBorderColor;

  final Color textButtonColor;
  final Color textButtonHoveredColor;
  final Color textButtonPressedColor;

  final Color shadowOnBackgroundColor;
  final Color shadowOnSurfaceColor;

  final Color selectedTabColor;
  final Color unSelectedTabColor;
  final Color tabIconShadowColor;

  final Color errorTextColor;
  final Color errorFieldColor;

  CustomThemeExtension(
      {required this.backgroundColor,
      required this.sectionColor,
      required this.sectionBorderColor,
      required this.textColor,
      required this.textFieldBackgroundColor,
      required this.textFieldForegroundColor,
      required this.textFieldHintColor,
      required this.textFieldCursorColor,
      required this.textFieldEnabledBorderColor,
      required this.textFieldFocusedBorderColor,
      required this.buttonForegroundColor,
      required this.buttonBackgroundColor,
      required this.buttonHoverdBackgroundColor,
      required this.buttonPressedBackgroundColor,
      required this.taskButtonForegroundColor,
      required this.taskButtonBackgroundColor,
      required this.taskButtonHoverdBackgroundColor,
      required this.taskButtonActivatedBackgroundColor,
      required this.taskButtonBorderColor,
      required this.textButtonColor,
      required this.textButtonHoveredColor,
      required this.textButtonPressedColor,
      required this.shadowOnBackgroundColor,
      required this.shadowOnSurfaceColor,
      required this.selectedTabColor,
      required this.unSelectedTabColor,
      required this.tabIconShadowColor,
      required this.errorTextColor,
      required this.errorFieldColor});

  @override
  CustomThemeExtension copyWith({
    Color? backgroundColor,
    Color? sectionColor,
    Color? textColor,
    Color? textFieldBackgroundColor,
    Color? textFieldHintColor,
    Color? textFieldCursorColor,
    Color? textFieldForegroundColor,
    Color? textFieldEnabledBorderColor,
    Color? textFieldFocusedBorderColor,
    Color? sectionBorderColor,
    Color? buttonBackgroundColor,
    Color? buttonHoverdBackgroundColor,
    Color? buttonPressedBackgroundColor,
    Color? buttonForegroundColor,
    Color? taskButtonForegroundColor,
    Color? taskButtonBackgroundColor,
    Color? taskButtonHoverdBackgroundColor,
    Color? taskButtonActivatedBackgroundColor,
    Color? taskButtonBorderColor,
    Color? textButtonColor,
    Color? textButtonHoveredColor,
    Color? textButtonPressedColor,
    Color? shadowOnBackgroundColor,
    Color? shadowOnSurfaceColor,
    Color? selectedTabColor,
    Color? unSelectedTabColor,
    Color? tabIconShadowColor,
    Color? errorTextColor,
    Color? errorFieldColor,
  }) {
    return CustomThemeExtension(
      textColor: textColor ?? this.textColor,
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
      buttonHoverdBackgroundColor:
          buttonHoverdBackgroundColor ?? this.buttonHoverdBackgroundColor,
      buttonPressedBackgroundColor:
          buttonPressedBackgroundColor ?? this.buttonPressedBackgroundColor,
      buttonForegroundColor:
          buttonForegroundColor ?? this.buttonForegroundColor,
      textButtonColor: textButtonColor ?? this.textButtonColor,
      textButtonHoveredColor:
          textButtonHoveredColor ?? this.textButtonHoveredColor,
      textButtonPressedColor:
          textButtonPressedColor ?? this.textButtonPressedColor,
      shadowOnBackgroundColor:
          shadowOnBackgroundColor ?? this.shadowOnBackgroundColor,
      shadowOnSurfaceColor: shadowOnSurfaceColor ?? this.shadowOnSurfaceColor,
      selectedTabColor: selectedTabColor ?? this.selectedTabColor,
      unSelectedTabColor: unSelectedTabColor ?? this.unSelectedTabColor,
      tabIconShadowColor: tabIconShadowColor ?? this.tabIconShadowColor,
      errorTextColor: errorTextColor ?? this.errorTextColor,
      errorFieldColor: errorFieldColor ?? this.errorFieldColor,
      taskButtonForegroundColor:
          taskButtonForegroundColor ?? this.taskButtonForegroundColor,
      taskButtonBackgroundColor:
          taskButtonBackgroundColor ?? this.taskButtonBackgroundColor,
      taskButtonHoverdBackgroundColor: taskButtonHoverdBackgroundColor ??
          this.taskButtonHoverdBackgroundColor,
      taskButtonActivatedBackgroundColor: taskButtonActivatedBackgroundColor ??
          this.taskButtonActivatedBackgroundColor,
      taskButtonBorderColor:
          taskButtonBorderColor ?? this.taskButtonBorderColor,
    );
  }

  @override
  CustomThemeExtension lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;

    return CustomThemeExtension(
      textColor: Color.lerp(textColor, other.textColor, t)!,
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
      buttonHoverdBackgroundColor: Color.lerp(
          buttonHoverdBackgroundColor, other.buttonHoverdBackgroundColor, t)!,
      buttonPressedBackgroundColor: Color.lerp(
          buttonPressedBackgroundColor, other.buttonPressedBackgroundColor, t)!,
      buttonForegroundColor:
          Color.lerp(buttonForegroundColor, other.buttonForegroundColor, t)!,
      textButtonColor: Color.lerp(textButtonColor, other.textButtonColor, t)!,
      textButtonHoveredColor:
          Color.lerp(textButtonHoveredColor, other.textButtonHoveredColor, t)!,
      textButtonPressedColor:
          Color.lerp(textButtonPressedColor, other.textButtonPressedColor, t)!,
      shadowOnBackgroundColor: Color.lerp(
          shadowOnBackgroundColor, other.shadowOnBackgroundColor, t)!,
      shadowOnSurfaceColor:
          Color.lerp(shadowOnSurfaceColor, other.shadowOnSurfaceColor, t)!,
      selectedTabColor:
          Color.lerp(selectedTabColor, other.selectedTabColor, t)!,
      unSelectedTabColor:
          Color.lerp(unSelectedTabColor, other.unSelectedTabColor, t)!,
      tabIconShadowColor:
          Color.lerp(tabIconShadowColor, other.tabIconShadowColor, t)!,
      errorTextColor: Color.lerp(errorTextColor, other.errorTextColor, t)!,
      errorFieldColor: Color.lerp(errorFieldColor, other.errorFieldColor, t)!,
      taskButtonForegroundColor: Color.lerp(
          taskButtonForegroundColor, other.taskButtonForegroundColor, t)!,
      taskButtonBackgroundColor: Color.lerp(
          taskButtonBackgroundColor, other.taskButtonBackgroundColor, t)!,
      taskButtonHoverdBackgroundColor: Color.lerp(
          taskButtonHoverdBackgroundColor,
          other.taskButtonHoverdBackgroundColor,
          t)!,
      taskButtonActivatedBackgroundColor: Color.lerp(
          taskButtonActivatedBackgroundColor,
          other.taskButtonActivatedBackgroundColor,
          t)!,
      taskButtonBorderColor:
          Color.lerp(taskButtonBorderColor, other.taskButtonBorderColor, t)!,
    );
  }
}
