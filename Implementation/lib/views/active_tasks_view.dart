import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/model/models.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';
import 'package:zamaan/widgets/custom_widgets.dart';
import 'package:zamaan/data/data.dart';

/// All active tasks, works, projects, plans, etc. will be displayed on this view
class ActiveTasksView extends StatelessWidget implements BaseView {
  const ActiveTasksView({super.key});

  static String get routeName => 'active-tasks-view';

  @override
  String get viewTitle => 'Active Tasks';

  @override
  IconData get icon => Icons.workspaces;

  @override
  Widget build(BuildContext context) {
    final List<MainTaskModel> mainTasksProvider =
        context.watch<MainTaskProvider>().tasks;
    return ListView.builder(
        itemCount: mainTasksProvider.length,
        itemBuilder: (context, index) {
          final task = mainTasksProvider[index];
          return Visibility(
            visible: !task.isDone,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTaskButtonWidget(
                task: task,
                donePercentage: Random().nextDouble() * 1,
              ),
            ),
          );
        });
  }
}
