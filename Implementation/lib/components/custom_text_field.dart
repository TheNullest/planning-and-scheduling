import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscureText;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.isObscureText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextField(
        obscureText: isObscureText,
        controller: controller,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.secondary,
          focusColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.surface),
          ),
          hoverColor: Theme.of(context).colorScheme.onSurface,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.surface),
          ),
        ),
      ),
    );
  }
}
