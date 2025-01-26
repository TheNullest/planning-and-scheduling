// import 'package:flutter/material.dart';

// class TextFieldThemeColors {
//   TextFieldThemeColors({
//     required this.textFieldBackgroundColor,
//     required this.textFieldForegroundColor,
//     required this.textFieldHintColor,
//     required this.textFieldCursorColor,
//     required this.textFieldEnabledBorderColor,
//     required this.textFieldFocusedBorderColor,
//   });
//   final Color textFieldBackgroundColor;
//   final Color textFieldForegroundColor;
//   final Color textFieldHintColor;
//   final Color textFieldCursorColor;
//   final Color textFieldEnabledBorderColor;
//   final Color textFieldFocusedBorderColor;

//   TextFieldThemeColors copyWith({
//     Color? textFieldBackgroundColor,
//     Color? textFieldForegroundColor,
//     Color? textFieldHintColor,
//     Color? textFieldCursorColor,
//     Color? textFieldEnabledBorderColor,
//     Color? textFieldFocusedBorderColor,
//   }) =>
//       TextFieldThemeColors(
//         textFieldBackgroundColor:
//             textFieldBackgroundColor ?? this.textFieldBackgroundColor,
//         textFieldForegroundColor:
//             textFieldForegroundColor ?? this.textFieldForegroundColor,
//         textFieldHintColor: textFieldHintColor ?? this.textFieldHintColor,
//         textFieldCursorColor: textFieldCursorColor ?? this.textFieldCursorColor,
//         textFieldEnabledBorderColor:
//             textFieldEnabledBorderColor ?? this.textFieldEnabledBorderColor,
//         textFieldFocusedBorderColor:
//             textFieldFocusedBorderColor ?? this.textFieldFocusedBorderColor,
//       );

//   TextFieldThemeColors lerp(TextFieldThemeColors? other, dynamic t) =>
//       other == null
//           ? this
//           : TextFieldThemeColors(
//               textFieldForegroundColor: Color.lerp(
//                 textFieldForegroundColor,
//                 other.textFieldForegroundColor,
//                 t as double,
//               ),
//               textFieldBackgroundColor: Color.lerp(
//                 textFieldBackgroundColor,
//                 other.textFieldBackgroundColor,
//                 t,
//               ),
//               textFieldHintColor:
//                   Color.lerp(textFieldHintColor, other.textFieldHintColor, t),
//               textFieldCursorColor: Color.lerp(
//                 textFieldCursorColor,
//                 other.textFieldCursorColor,
//                 t,
//               ),
//               textFieldEnabledBorderColor: Color.lerp(
//                 textFieldEnabledBorderColor,
//                 other.textFieldEnabledBorderColor,
//                 t,
//               ),
//               textFieldFocusedBorderColor: Color.lerp(
//                 textFieldFocusedBorderColor,
//                 other.textFieldFocusedBorderColor,
//                 t,
//               ),
//             );
// }
