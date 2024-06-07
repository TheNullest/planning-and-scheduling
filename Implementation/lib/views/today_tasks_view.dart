import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zamaan/data/data.dart';
import 'package:zamaan/model/main_task_model.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/utilities/enums.dart';
import 'package:zamaan/utilities/providers/providers.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';
import 'package:zamaan/widgets/custom_widgets.dart';

/// All tasks, works, projects, plans, etc. for today will be displayed on this view
class TodaysTasksView extends StatefulWidget implements BaseView {
  const TodaysTasksView({super.key});

  @override
  State<TodaysTasksView> createState() => _TodaysTasksViewState();

  @override
  String get viewTitle => 'Today\'s Tasks View';

  @override
  IconData get icon => Icons.timer_outlined;
}

class _TodaysTasksViewState extends State<TodaysTasksView> {
  late int selectedTaskIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<MainTaskModel> mainTasksProvider =
        Provider.of<MainTaskProvider>(context).tasks;
    final CustomThemeExtension myTheme =
        Provider.of<ThemeProvider>(context).myTheme(context);
    final List<MainTaskModel> filteredMainTasks = mainTasksProvider
        .where(
            (task) => !task.isDone && task.repeat == RepetitionInterval.daily)
        .toList();
    return CustomScrollView(slivers: [
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final MainTaskModel task = filteredMainTasks[index];

          return CustomTaskButtonWidget(
            task: task,
            donePercentage: Random().nextDouble() * 1,
            index: index,
            isDisplayable:
                selectedTaskIndex > -1 && selectedTaskIndex == index ||
                    selectedTaskIndex == -1,
            myTheme: myTheme,
            onSelectedTaskChanged: (selectedTaskChanged) => setState(() {
              selectedTaskIndex = selectedTaskChanged;
            }),
          );
        }, childCount: filteredMainTasks.length),
      ),
    ]);
  }
}
