import 'package:flutter/material.dart';

class RawCustomButtonWidget extends StatefulWidget {
  final Widget child;

  final void Function(bool hovering)? onHover;
  final void Function(bool hovering)? onExit;
  final void Function(bool pressed)? onTapDown;
  final void Function(bool pressed)? onTapUp;
  final void Function(bool pressed)? onLongPressStart;
  final void Function(bool pressed)? onLongPressEnd;
  final MouseCursor cursor;

  const RawCustomButtonWidget(
      {super.key,
      this.onHover,
      this.onExit,
      this.onTapDown,
      this.onTapUp,
      this.onLongPressStart,
      this.onLongPressEnd,
      this.cursor = SystemMouseCursors.click,
      required this.child});

  @override
  State<RawCustomButtonWidget> createState() => _RawCustomButtonWidgetState();
}

class _RawCustomButtonWidgetState extends State<RawCustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onHover: (event) => widget.onHover?.call(true),
      onExit: (event) => widget.onExit?.call(true),
      child: GestureDetector(
          onTapDown: (tapDown) => widget.onTapDown?.call(true),
          onTapUp: (tapUp) => widget.onTapUp?.call(true),
          onLongPressStart: (start) =>
              {widget.onTapUp?.call(true), widget.onLongPressStart?.call(true)},
          onLongPressEnd: (end) {
            widget.onLongPressEnd?.call(true);
            widget.onHover?.call(true);
          },
          child: widget.child),
    );
  }
}
