import 'package:flutter/material.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';

class ReminderView extends StatelessWidget implements BaseView {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
    );
  }

  @override
  String get viewTitle => 'یادآوری ها';

  @override
  IconData get icon => Icons.notifications_active_outlined;
}
