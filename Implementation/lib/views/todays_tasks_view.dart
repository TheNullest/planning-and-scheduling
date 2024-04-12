import 'package:flutter/material.dart';
import 'package:zamaan/components/custom_components.dart';

/// All tasks, works, projects, plans, etc. for today will be displayed on this view
class TodaysTasksView extends StatefulWidget {
  const TodaysTasksView({super.key});

  @override
  State<TodaysTasksView> createState() => _TodaysTasksViewState();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today\'s Tasks View'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.red,
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: CustomAddTaskDialogButton(
                taskNameTextController: taskNameTextController,
                descriptionTextController: descriptionTextController,
              ))
        ],
      ),
    );
  }
}
