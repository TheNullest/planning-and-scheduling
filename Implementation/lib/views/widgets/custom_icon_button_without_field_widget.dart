import 'package:flutter/material.dart';
import 'package:zamaan/views/widgets/raws/abstracts/abstract_raw_custom_button.dart';
import 'package:zamaan/views/widgets/raws/raw_custom_button_widget.dart';

class CustomIconButtonWithoutFieldWidget extends AbstractRawCustomButton {
  final IconData icon;
  final Color iconColor;
  final double? iconSize;
  const CustomIconButtonWithoutFieldWidget({
    required this.iconColor,
    super.key,
    required this.icon,
    this.iconSize,
    super.onTap,
    super.onHover,
    super.onTapDown,
    super.onTapUp,
    super.childPrimaryColor,
    super.child,
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
      color: widget.iconColor,
    ));
  }
}
