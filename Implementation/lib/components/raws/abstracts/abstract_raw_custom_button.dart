import 'package:flutter/material.dart';

///
abstract class AbstractRawCustomButton extends StatefulWidget {
  final void Function() onTap;
  final Color? childPrimaryColor;
  final Color? onHover;
  final Color? onTapDown;
  final Color? onTapUp;
  final Widget child;

  const AbstractRawCustomButton({
    super.key,
    required this.child,
    required this.onTap,
    this.childPrimaryColor,
    this.onHover,
    this.onTapDown,
    this.onTapUp,
  });
}
