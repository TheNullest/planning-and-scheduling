import 'package:flutter/material.dart';
import 'package:zamaan/core/services/router.dart';

Future navigatorPushRemoveUntil(
  BuildContext context,
  String route, {
  bool predicate = false,
}) async =>
    Navigator.of(context).pushAndRemoveUntil(
      generateRoute(
        RouteSettings(name: route),
      ),
      (route) => predicate,
    );
