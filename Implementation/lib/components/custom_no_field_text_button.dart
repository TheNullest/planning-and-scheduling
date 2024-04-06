import 'package:flutter/material.dart';

class CustomNoFieldTextButton extends StatefulWidget {
  final Function() onTap;
  final String name;

  const CustomNoFieldTextButton(
      {super.key, required this.onTap, required this.name});

  @override
  State<CustomNoFieldTextButton> createState() =>
      _CustomNoFieldTextButtonState();
}

class _CustomNoFieldTextButtonState extends State<CustomNoFieldTextButton> {
  late Color textColor = Theme.of(context).colorScheme.onSurface;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        onHover: _onHoverTextColor,
        child: Text(
          widget.name,
          textDirection: TextDirection.rtl,
          style: TextStyle(shadows: const [
            Shadow(color: Colors.black, offset: Offset(1, 2), blurRadius: 5)
          ], fontSize: 13, color: textColor, fontWeight: FontWeight.bold),
        ));
  }

  // changing the text color when mouse is hover
  void _onHoverTextColor(isHover) {
    setState(() => isHover
        ? textColor = Theme.of(context).colorScheme.secondary
        : textColor = Theme.of(context).colorScheme.onSurface);
  }
}
