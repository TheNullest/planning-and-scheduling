import 'package:flutter/material.dart';
import 'package:zamaan/models/models.dart';
import 'package:zamaan/utilities/themes/themes.dart';
import 'package:zamaan/utilities/utilities.dart';
import 'package:zamaan/views/widgets/custom_task_button_widget_components/custom_task_button_percentage_icon.dart';
import 'package:zamaan/views/widgets/custom_task_button_widget_components/custom_task_button_title_widget.dart';

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
  void initState() {
    super.initState();
    donePercentage = _donePercentageCalculator();
  }

  @override
  Widget build(BuildContext context) {
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
      child: Center(
        child: Stack(children: [
          _mainContent(),
          // _buildCompletedState(),
        ]),
      ),
    );
  }

  Padding _mainContent() {
    return Padding(
      padding: EdgeInsets.all(widget.isDisplayed ? 10 : 0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        // Icon and percentage section
        CustomTaskButtonPercentageIcon(
          goal: widget.task.goal!,
          spentTime: Duration(milliseconds: widget.task.totalSpentTime!),
          donePercentage: donePercentage,
          foreground: widget.foregroundColor,
          icon: IconData(widget.task.iconCode),
          taskColor: Colors.purple,
        ),
        // 10.0.sizedBoxWidth,
        // // running icon
        // Expanded(
        //   flex: 4,
        //   child: CustomTaskButtonTitleWidget(
        //     taskName: widget.task.title,
        //     icon: IconData(widget.task.iconCode),
        //     isActivated: widget.isActivated,
        //   ),
        // ),
      ]),
    );
  }

  // when the task is completed, this box will be displayed
  // and it will show the done state
  AnimatedOpacity _buildCompletedState() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: donePercentage == 1 && widget.isDisplayed ? .7 : 0,
      curve: Curves.easeInOutCirc,
      child: ColoredBox(
        color:
            widget.myTheme.taskButtonColors.taskButtonCompletedBackgroundColor,
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
    );
  }

  double _donePercentageCalculator() => widget.task.goal != null
      ? (widget.task.totalSpentTime! * 0.00027778) /
          (widget.task.goal!.perDay * 0.00027778)
      : 0;
}
