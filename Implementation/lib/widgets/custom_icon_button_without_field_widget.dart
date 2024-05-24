import 'package:flutter/material.dart';
import 'package:zamaan/widgets/raws/abstracts/abstract_raw_custom_button.dart';
import 'package:zamaan/widgets/raws/raw_custom_button_widget.dart';

class CustomIconButtonWithoutFieldWidget extends AbstractRawCustomButton {
  final IconData icon;
  final double? iconSize;
  const CustomIconButtonWithoutFieldWidget({
    super.key,
    required this.icon,
    this.iconSize,
    required super.onTap,
    required super.child,
    super.onHover,
    super.onTapDown,
    super.onTapUp,
    super.childPrimaryColor,
  });

  @override
  State<CustomIconButtonWithoutFieldWidget> createState() =>
      _CustomIconButtonWithoutFieldState();
}

class _CustomIconButtonWithoutFieldState
    extends State<CustomIconButtonWithoutFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return RawCustomButtonWidget(
        child: Icon(
      widget.icon,
      size: widget.iconSize,
    ));
  }
}
