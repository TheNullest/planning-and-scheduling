import 'package:flutter/material.dart';

class TabThemeColors {
  final Color selectedTabColor;
  final Color unSelectedTabColor;
  final Color tabIconShadowColor;

  TabThemeColors(
      {required this.selectedTabColor,
      required this.unSelectedTabColor,
      required this.tabIconShadowColor});

  TabThemeColors copyWith(
          {Color? selectedTabColor,
          Color? unSelectedTabColor,
          Color? tabIconShadowColor}) =>
      TabThemeColors(
          selectedTabColor: selectedTabColor ?? this.selectedTabColor,
          unSelectedTabColor: unSelectedTabColor ?? this.unSelectedTabColor,
          tabIconShadowColor: tabIconShadowColor ?? this.tabIconShadowColor);

  TabThemeColors lerp(TabThemeColors? other, t) => other == null
      ? this
      : TabThemeColors(
          selectedTabColor:
              Color.lerp(selectedTabColor, other.selectedTabColor, t)!,
          unSelectedTabColor:
              Color.lerp(unSelectedTabColor, other.unSelectedTabColor, t)!,
          tabIconShadowColor:
              Color.lerp(tabIconShadowColor, other.tabIconShadowColor, t)!,
        );
}
