import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zamaan/utilities/responsive_helper.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';
import 'package:zamaan/views/sections/today_tasks_view_sections/today_active_tasks_sections.dart';
import 'package:zamaan/views/sections/today_tasks_view_sections/today_tasks_section.dart';
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
  final TextEditingController taskNameTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();
  @override
  void dispose() {
    taskNameTextController.dispose();
    descriptionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(child: TodayActiveTasksSection()),
            SliverToBoxAdapter(child: Divider()),
            TodayTasksSection(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 70,
              ),
            ),
          ],
        ),
        Positioned(
            bottom: 20,
            right: 20,
            child: CustomAddTaskDialogButton(
              taskNameTextController: taskNameTextController,
              descriptionTextController: descriptionTextController,
            ))
      ],
    );
  }
}
