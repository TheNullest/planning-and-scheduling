// import 'package:flutter/material.dart';

// class TabThemeColors {
//   TabThemeColors({
//     required this.selectedTabColor,
//     required this.unSelectedTabColor,
//     required this.tabIconShadowColor,
//   });
//   final Color selectedTabColor;
//   final Color unSelectedTabColor;
//   final Color tabIconShadowColor;

//   TabThemeColors copyWith({
//     Color? selectedTabColor,
//     Color? unSelectedTabColor,
//     Color? tabIconShadowColor,
//   }) =>
//       TabThemeColors(
//         selectedTabColor: selectedTabColor ?? this.selectedTabColor,
//         unSelectedTabColor: unSelectedTabColor ?? this.unSelectedTabColor,
//         tabIconShadowColor: tabIconShadowColor ?? this.tabIconShadowColor,
//       );

//   TabThemeColors lerp(TabThemeColors? other, dynamic t) => other == null
//       ? this
//       : TabThemeColors(
//           selectedTabColor: Color.lerp(
//             selectedTabColor,
//             other.selectedTabColor,
//             t as double,
//           ),
//           unSelectedTabColor:
//               Color.lerp(unSelectedTabColor, other.unSelectedTabColor, t),
//           tabIconShadowColor:
//               Color.lerp(tabIconShadowColor, other.tabIconShadowColor, t),
//         );
// }
