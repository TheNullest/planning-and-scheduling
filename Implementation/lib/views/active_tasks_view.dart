import 'package:flutter/material.dart';

/// All active tasks, works, projects, plans, etc. will be displayed on this view
class ActiveTasksView extends StatelessWidget {
  const ActiveTasksView({super.key});

  static String routeName = 'active-tasks-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Tasks'),
      ),
    );
  }
}
