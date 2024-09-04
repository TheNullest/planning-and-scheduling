import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zamaan/models/main_task_model.dart';
import 'package:zamaan/utilities/themes/themes.dart';
import 'package:zamaan/utilities/utilities.dart';
import 'package:zamaan/views/widgets/custom_task_button_widget_components/custom_task_button_tile_widget.dart';
import 'package:zamaan/views/widgets/custom_task_button_widget_components/custom_task_button_options_widget.dart';

class CustomTaskButtonWidget extends StatefulWidget {
  final double donePercentage;
  final int index;
  final MainTaskModel task;
  final CustomThemeExtension myTheme;

  /// A value to determine whether or not to show the widget
  /// after checking if another button is selected and open
  ///
  /// Only the selected task will remain open and all others will be closed

  final bool isDisplayable;

  /// bcz dont want to use another gesture detector
  /// on the list of the task buttons,
  final void Function(int) onSelectedTaskChanged;

  const CustomTaskButtonWidget(
      {super.key,
      required this.donePercentage,
      required this.index,
      required this.task,
      required this.myTheme,
      required this.isDisplayable,
      required this.onSelectedTaskChanged});

  @override
  State<CustomTaskButtonWidget> createState() => _CustomTaskButtonWidgetState();
}

class _CustomTaskButtonWidgetState extends State<CustomTaskButtonWidget>
    with SingleTickerProviderStateMixin {
  late Color backgroundColor =
      widget.myTheme.taskButtonColors.taskButtonBackgroundColor;
  late Color foregroundColor =
      widget.myTheme.taskButtonColors.taskButtonForegroundColor;
  late MouseCursor cursor = SystemMouseCursors.click;
  late bool opensOptionsSection = false;
  late bool isOptionsSectionCompletelyOpened = false;
  late bool taskActivated = false;
  late double fullHeigth;
  late EdgeInsets taskTileMargin = EdgeInsets.only(
    bottom: 10,
    top: widget.index == 0 ? 10 : 0,
    left: 10,
    right: 10,
  );
  @override
  Widget build(BuildContext context) {
    fullHeigth =
        MediaQuery.sizeOf(context).height - ResponsiveHelper.statusBarHeight;
    log(fullHeigth.toString());
    if (fullHeigth < 500) fullHeigth = 500;

    return SafeArea(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        // height: widget.isDisplayable
        //     ? opensOptionsSection
        //         ? fullHeigth
        //         : 70
        //     : 0,
        height: 70,
        margin: !opensOptionsSection && widget.isDisplayable
            ? taskTileMargin
            : EdgeInsets.zero,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(15)),
        child: Column(children: [
          // header
          CustomTaskButtonTileWidget(
              task: widget.task,
              onTaskActivated: (activated) => setState(() {
                    taskActivated = activated;
                  }),
              index: widget.index,
              isDisplayed: widget.isDisplayable,
              onSelectedTaskChanged: (index, opensOptionsSection) =>
                  setState(() {
                    this.opensOptionsSection = opensOptionsSection;
                    widget.onSelectedTaskChanged(index);
                  }),
              backgroundColor: backgroundColor,
              foreground: foregroundColor,
              canOpenOptionsSection: !opensOptionsSection,
              myTheme: widget.myTheme),

          // options section
          CustomTaskButtonOptionsWidget(
              taskActivated: taskActivated,
              mainTask: widget.task,
              myTheme: widget.myTheme,
              optionsSectionClosed: () => setState(() {
                    opensOptionsSection = false;
                    widget.onSelectedTaskChanged(-1);
                  }),
              opensOptionsSection: opensOptionsSection)
        ]),
      ),
    );
  }
}
