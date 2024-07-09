import 'package:flutter/material.dart';
import 'package:zamaan/data/models.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/utilities/utilities.dart';
import 'package:zamaan/widgets/custom_task_button_widget_components/custom_task_button_percentage_icon.dart';
import 'package:zamaan/widgets/custom_task_button_widget_components/custom_task_button_title_widget.dart';

class BigTaskButtonTile extends StatefulWidget {
  final bool isDisplayed;
  final bool isActivated;
  final bool canOpenOptionsSection;
  final CustomThemeExtension myTheme;
  final MainTaskModel task;
  final Color foregroundColor;
  final Color backgroundColor;

  const BigTaskButtonTile({
    super.key,
    required this.isDisplayed,
    required this.myTheme,
    required this.canOpenOptionsSection,
    required this.task,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.isActivated,
  });

  @override
  State<BigTaskButtonTile> createState() => _BigTaskButtonTileState();
}

class _BigTaskButtonTileState extends State<BigTaskButtonTile> {
  late double donePercentage;

  @override
  Widget build(BuildContext context) {
    donePercentage = _donePercentageCalculator();
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.canOpenOptionsSection
            ? BorderRadius.circular(15)
            : BorderRadius.zero,
        border: !widget.canOpenOptionsSection
            ? Border(
                bottom: BorderSide(
                    width: 2,
                    color:
                        widget.myTheme.taskButtonColors.taskButtonBorderColor),
              )
            : null,
      ),
      child: Stack(children: [
        // Done state
        // when the task is completed, this box will be displayed
        // and it will show the done state
        AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: donePercentage == 1 && widget.isDisplayed ? .7 : 0,
          curve: Curves.easeInOutCirc,
          child: ColoredBox(
            color:
                widget.myTheme.taskButtonColors.taskButtonDoneBackgroundColor,
            child: const SizedBox(
              height: 80,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Icon(
                  Icons.done,
                  color: Color.fromARGB(255, 27, 98, 156),
                ),
              ),
            ),
          ),
        ),

        // main
        Padding(
          padding: EdgeInsets.all(widget.isDisplayed ? 10 : 0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            // Icon and percentage section
            Expanded(
              flex: 5,
              child: CustomTaskButtonPercentageIcon(
                goal: widget.task.goal!,
                spentTime: widget.task.totalSpentTime!,
                donePercentage: donePercentage,
                foreground: widget.foregroundColor,
                icon: widget.task.icon,
                taskColor: widget.task.color,
              ),
            ),
            10.0.sizedBoxWidth,
            // running icon
            Expanded(
              flex: 4,
              child: CustomTaskButtonTitleWidget(
                taskName: widget.task.title,
                icon: widget.task.icon,
                isActivated: widget.isActivated,
              ),
            ),
          ]),
        ),
      ]),
    );
  }

  double _donePercentageCalculator() => widget.task.goal != null
      ? (widget.task.totalSpentTime!.inSeconds /
          widget.task.goal!.daily.inSeconds)
      : 0;
}
