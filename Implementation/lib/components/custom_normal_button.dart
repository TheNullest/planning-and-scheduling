import 'package:flutter/material.dart';

class CustomNormalButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double minWidth;
  const CustomNormalButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.minWidth = double.infinity});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      hoverElevation: 10,
      constraints: BoxConstraints(minWidth: minWidth, minHeight: 50),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      fillColor: Theme.of(context).colorScheme.secondary,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
