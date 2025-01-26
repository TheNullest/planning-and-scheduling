import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context,
  String content, {
  Duration duration = const Duration(seconds: 10),
}) =>
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          showCloseIcon: true,
          content: Text(content),
          duration: duration,
        ),
      );
