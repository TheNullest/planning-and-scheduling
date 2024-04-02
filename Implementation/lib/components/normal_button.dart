import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const NormalButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      hoverElevation: 10,
      constraints: const BoxConstraints(minWidth: 220, minHeight: 50),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      highlightColor: Theme.of(context).colorScheme.tertiary,
      fillColor: Theme.of(context).colorScheme.secondary,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
