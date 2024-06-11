import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RawCustomButtonWidget extends StatefulWidget {
  final Widget child;

  final void Function(bool hovering)? onHover;
  final void Function(bool hovering)? onExit;
  final void Function(bool pressed)? onTap;
  final void Function(bool pressed)? onTapDown;
  final void Function(bool pressed)? onTapUp;
  final void Function(bool pressed)? onLongPress;
  final void Function(bool pressed)? onLongPressStart;
  final void Function(bool pressed)? onLongPressEnd;
  final void Function()? onDoubleTap;
  final MouseCursor cursor;

  const RawCustomButtonWidget({
    super.key,
    this.onHover,
    this.onExit,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onLongPress,
    this.onLongPressStart,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.cursor = SystemMouseCursors.click,
    required this.child,
  });

  @override
  State<RawCustomButtonWidget> createState() => _RawCustomButtonWidgetState();
}

class _RawCustomButtonWidgetState extends State<RawCustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: widget.cursor,
      onHover: (event) => widget.onHover?.call(true),
      onExit: (event) => widget.onExit?.call(true),
      child: GestureDetector(
          onTap: () => {
                HapticFeedback.heavyImpact(),
                widget.onTap?.call(true),
              },
          onTapDown: (tapDown) => {
                widget.onTapDown?.call(true),
              },
          onTapUp: (tapUp) => widget.onTapUp?.call(true),
          onLongPress: () => {
                HapticFeedback.selectionClick(),
                widget.onLongPress?.call(true),
              },
          onLongPressStart: (start) => {
                widget.onLongPressStart?.call(true),
              },
          onLongPressEnd: (end) => widget.onLongPressEnd?.call(true),
          onDoubleTap: () => widget.onDoubleTap?.call(),
          child: widget.child),
    );
  }
}
