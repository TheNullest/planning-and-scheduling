import 'package:flutter/material.dart';

class CustomNoFieldTextButton extends StatelessWidget {
  final Function() onTap;
  final String name;

  const CustomNoFieldTextButton(
      {super.key, required this.onTap, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Text(
          name,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              shadows: const [
                Shadow(color: Colors.black, offset: Offset(1, 2), blurRadius: 5)
              ],
              fontSize: 10,
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold),
        ));
  }
}
