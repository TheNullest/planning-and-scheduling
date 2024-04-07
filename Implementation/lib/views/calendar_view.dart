import 'package:flutter/material.dart';

/// All tasks, plans, etc. will be displayed in
/// daily, weekly, monthly and yearly view.
/// The greater the amount and number of tasks of that day, week, etc.
/// the brighter the color will be.
class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar View'),
      ),
    );
  }
}
