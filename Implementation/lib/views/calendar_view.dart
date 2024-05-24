import 'package:flutter/material.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';

/// All tasks, plans, etc. will be displayed in
/// daily, weekly, monthly and yearly view.
/// The greater the amount and number of tasks of that day, week, etc.
/// the brighter the color will be.
class CalendarView extends StatefulWidget implements BaseView {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();

  @override
  String get viewTitle => 'Calendar View';

  @override
  IconData get icon => Icons.calendar_month_outlined;
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
