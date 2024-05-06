import 'package:flutter/material.dart';
import 'package:zamaan/components/raws/abstracts/abstract_raw_custom_button.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';

class RawCustomButton extends AbstractRawCustomButton {
  const RawCustomButton(
      {super.key,
      required super.child,
      required super.onTap,
      super.childPrimaryColor,
      super.onHover,
      super.onTapDown,
      super.onTapUp});

  @override
  State<RawCustomButton> createState() => _RawCustomButtonState();
}

class _RawCustomButtonState extends State<RawCustomButton> {
  bool isHovering = false;

  late Color filterColor =
      widget.childPrimaryColor ?? Theme.of(context).colorScheme.secondary;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) {
        isHovering = true;
        setState(() {
          filterColor = widget.onHover ??
              ThemeProvider.myTheme(context).buttonBackgroundColor;
        });
      },
      onExit: (event) {
        isHovering = false;
        setState(() {
          filterColor = widget.childPrimaryColor ??
              Theme.of(context).colorScheme.secondary;
        });
      },
      child: GestureDetector(
          onTapDown: (tapDown) => {
                setState(() {
                  filterColor =
                      widget.onTapDown ?? Theme.of(context).colorScheme.surface;
                })
              },
          onTapUp: (tapUp) => {
                setState(() {
                  filterColor =
                      widget.onHover ?? Theme.of(context).colorScheme.surface;
                })
              },
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(filterColor, BlendMode.modulate),
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                decoration: const BoxDecoration(),
                child: widget.child),
          )),
    );
  }
}
