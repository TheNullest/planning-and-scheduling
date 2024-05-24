import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/data/data.dart';
import 'package:zamaan/data/enums.dart';
import 'package:zamaan/model/main_task_model.dart';
import 'package:zamaan/widgets/custom_widgets.dart';

class TodayTasksSection extends StatefulWidget {
  const TodayTasksSection({super.key});

  @override
  State<TodayTasksSection> createState() => _TodayTasksSectionState();
}

class _TodayTasksSectionState extends State<TodayTasksSection> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<MainTaskModel> mainTasksProvider =
        Provider.of<MainTaskProvider>(context).tasks;

    final List<MainTaskModel> filteredMainTasks = mainTasksProvider
        .where(
            (task) => !task.isDone && task.repeat == RepetitionInterval.daily)
        .toList();
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final MainTaskModel task = filteredMainTasks[index];

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTaskButtonWidget(
              task: task,
              displaySettings: index == _selectedIndex ? true : false,
              donePercentage: Random().nextDouble() * 1,
            ),
          ),
        );
      }, childCount: filteredMainTasks.length),
    );
  }
}
