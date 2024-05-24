import 'package:flutter/material.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';

class ReminderView extends StatefulWidget implements BaseView {
  const ReminderView({super.key});

  @override
  State<ReminderView> createState() => _ReminderViewState();

  @override
  String get viewTitle => 'Reminder View';

  @override
  IconData get icon => Icons.notifications_active_outlined;
}

class _ReminderViewState extends State<ReminderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
