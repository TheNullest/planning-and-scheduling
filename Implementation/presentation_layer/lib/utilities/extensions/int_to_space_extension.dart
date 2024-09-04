import 'package:flutter/material.dart';

extension DoubleToSpaceExtension on double? {
  double validate({double value = 0}) => this ?? value;

  Widget get sizedBoxHeight => SizedBox(
        height: this?.toDouble(),
      );
  Widget get sizedBoxWidth => SizedBox(
        width: this?.toDouble(),
      );
}
