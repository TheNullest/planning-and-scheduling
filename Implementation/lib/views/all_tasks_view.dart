import 'package:flutter/material.dart';

class AllTasksView extends StatelessWidget {
  const AllTasksView({super.key});

  static String routeName = 'all-tasks-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Tasks'),
      ),
    );
  }
}
