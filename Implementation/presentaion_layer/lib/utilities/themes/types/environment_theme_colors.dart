import 'package:flutter/material.dart';

class EnvironmentThemeColors {
  final Color mainBackgroundColor;
  final Color mainTextColor;
  final Color mainDividerColor;
  final Color sectionBackgroundColor;
  final Color sectionShadowColor;
  final Color sectionTextColor;
  final Color sectionDividerColor;
  final Color sectionBorderColor;
  final Color widgetBackgroundColor;
  final Color widgetShadowColor;
  final Color widgetTextColor;
  final Color widgetBorderColor;

  EnvironmentThemeColors(
      {required this.mainBackgroundColor,
      required this.mainDividerColor,
      required this.mainTextColor,
      required this.sectionBackgroundColor,
      required this.sectionShadowColor,
      required this.sectionTextColor,
      required this.sectionDividerColor,
      required this.sectionBorderColor,
      required this.widgetBackgroundColor,
      required this.widgetShadowColor,
      required this.widgetTextColor,
      required this.widgetBorderColor});

  EnvironmentThemeColors copyWith(
          {Color? mainBackgroundColor,
          Color? mainTextColor,
          Color? mainDividerColor,
          Color? sectionBackgroundColor,
          Color? sectionShadowColor,
          Color? sectionDividerColor,
          Color? sectionTextColor,
          Color? sectionBorderColor,
          Color? widgetBackgroundColor,
          Color? widgetShadowColor,
          Color? widgetTextColor,
          Color? widgetBorderColor}) =>
      EnvironmentThemeColors(
          mainBackgroundColor: mainBackgroundColor ?? this.mainBackgroundColor,
          mainTextColor: mainTextColor ?? this.mainTextColor,
          mainDividerColor: mainDividerColor ?? this.mainDividerColor,
          sectionBackgroundColor:
              sectionBackgroundColor ?? this.sectionBackgroundColor,
          sectionShadowColor: sectionShadowColor ?? this.sectionShadowColor,
          sectionTextColor: sectionTextColor ?? this.sectionTextColor,
          sectionDividerColor: sectionDividerColor ?? this.sectionDividerColor,
          sectionBorderColor: sectionBorderColor ?? this.sectionBorderColor,
          widgetBackgroundColor:
              widgetBackgroundColor ?? this.widgetBackgroundColor,
          widgetShadowColor: widgetShadowColor ?? this.widgetShadowColor,
          widgetTextColor: widgetTextColor ?? this.widgetTextColor,
          widgetBorderColor: widgetBorderColor ?? this.widgetBorderColor);

  EnvironmentThemeColors lerp(EnvironmentThemeColors? other, t) => other == null
      ? this
      : EnvironmentThemeColors(
          mainBackgroundColor:
              Color.lerp(mainBackgroundColor, other.mainBackgroundColor, t)!,
          mainTextColor: Color.lerp(mainTextColor, other.mainTextColor, t)!,
          mainDividerColor:
              Color.lerp(mainDividerColor, other.mainDividerColor, t)!,
          sectionBackgroundColor: Color.lerp(
              sectionBackgroundColor, other.sectionBackgroundColor, t)!,
          sectionBorderColor:
              Color.lerp(sectionBorderColor, other.sectionBorderColor, t)!,
          sectionShadowColor:
              Color.lerp(sectionShadowColor, other.sectionShadowColor, t)!,
          sectionTextColor:
              Color.lerp(sectionTextColor, other.sectionTextColor, t)!,
          sectionDividerColor:
              Color.lerp(sectionDividerColor, other.sectionDividerColor, t)!,
          widgetShadowColor:
              Color.lerp(widgetShadowColor, other.widgetShadowColor, t)!,
          widgetTextColor:
              Color.lerp(widgetTextColor, other.widgetTextColor, t)!,
          widgetBackgroundColor: Color.lerp(
              widgetBackgroundColor, other.widgetBackgroundColor, t)!,
          widgetBorderColor:
              Color.lerp(widgetBorderColor, other.widgetBorderColor, t)!,
        );
}
