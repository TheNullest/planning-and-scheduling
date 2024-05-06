import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/components/custom_components.dart';
import 'package:zamaan/data/enums.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';
import 'package:zamaan/utilities/responsive_helper.dart';

import '../data/data.dart';

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
          SizedBox(
            height: double.maxFinite,
            child: Scrollbar(
              thumbVisibility: false,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.maxFinite,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        child: Text(
                          'در حال اجرا',
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mainTasks.length * 40,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: mainTasks.length + 2,
                        itemBuilder: (context, index) {
                          if (index >= mainTasks.length) {
                            return const SizedBox(
                              height: 35,
                            );
                          } else {
                            final task = mainTasks[index];
                            return Visibility(
                              visible: !task.isDone &&
                                  task.repeat == RepetitionInterval.daily,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomTaskButton(
                                  text: mainTasks[index].mainTaskName,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    CustomSwitch(
                        value: !Provider.of<ThemeProvider>(context).isDarkMode,
                        onChanged: (value) {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme();
                        }),
                    Text(Provider.of<ThemeProvider>(context).selectedMode)
                  ],
                ),
              ),
            ),
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
