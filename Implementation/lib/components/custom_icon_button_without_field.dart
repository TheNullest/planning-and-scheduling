import 'package:flutter/material.dart';
import 'package:zamaan/components/raws/abstracts/abstract_raw_custom_button.dart';
import 'package:zamaan/components/raws/raw_custom_button.dart';

class CustomIconButtonWithoutField extends AbstractRawCustomButton {
  final IconData icon;
  final double? iconSize;
  const CustomIconButtonWithoutField({
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
  State<CustomIconButtonWithoutField> createState() =>
      _CustomIconButtonWithoutFieldState();
}

class _CustomIconButtonWithoutFieldState
    extends State<CustomIconButtonWithoutField> {
  @override
  Widget build(BuildContext context) {
    return RawCustomButton(
        onHover: widget.onHover,
        onTap: widget.onTap,
        onTapDown: widget.onTapDown,
        onTapUp: widget.onTapUp,
        childPrimaryColor: widget.childPrimaryColor,
        child: Icon(
          widget.icon,
          size: widget.iconSize,
        ));
  }
}
