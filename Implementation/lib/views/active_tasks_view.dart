import 'package:flutter/material.dart';
import 'package:zamaan/components/custom_components.dart';
import 'package:zamaan/data/data.dart';

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
      body: ListView.builder(
          itemCount: mainTasks.length,
          itemBuilder: (context, index) {
            final task = mainTasks[index];
            return Visibility(
              visible: !task.isDone,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTaskButton(
                  text: mainTasks[index].mainTaskName,
                ),
              ),
            );
          }),
    );
  }
}
