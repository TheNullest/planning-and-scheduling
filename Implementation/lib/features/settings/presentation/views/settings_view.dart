import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});
  static const String route = '/settings';

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.blueAccent,
      child: Center(
        child: Text('Settings'),
      ),
    );
  }
}
