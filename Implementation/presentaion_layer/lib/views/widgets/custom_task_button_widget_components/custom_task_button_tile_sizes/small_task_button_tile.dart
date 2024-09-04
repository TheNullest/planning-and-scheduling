import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zamaan/models/models.dart';
import 'package:zamaan/utilities/themes/themes.dart';
import 'package:zamaan/views/widgets/custom_task_button_widget_components/custom_task_button_percentage_icon.dart';
import 'package:zamaan/views/widgets/custom_task_button_widget_components/custom_task_button_title_widget.dart';
import 'dart:ui' as ui;

class SmallTaskButtonTile extends StatefulWidget {
  final bool isDisplayed;
  final bool isActivated;
  final bool canOpenOptionsSection;
  final CustomThemeExtension myTheme;
  final MainTaskModel task;
  final Color foregroundColor;
  final Color backgroundColor;

  const SmallTaskButtonTile({
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
  State<SmallTaskButtonTile> createState() => _BigTaskButtonTileState();
}

class _BigTaskButtonTileState extends State<SmallTaskButtonTile> {
  late double donePercentage;

  @override
  void initState() {
    if (widget.task.goal != null) {
      donePercentage = (widget.task.totalSpentTime! * 0.00027778) /
          (widget.task.goal!.perDay * 0.00027778);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.isDisplayed ? 200 : 50),
        curve: Curves.easeInOut,
        height: widget.isDisplayed ? 70 : 0,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: !widget.canOpenOptionsSection
              ? Border(
                  bottom: BorderSide(
                      width: 2,
                      color: widget
                          .myTheme.taskButtonColors.taskButtonBorderColor),
                )
              : null,
        ),
        child: Stack(children: [
          // when the task is completed, this box will be displayed
          // and it will show the done status
          AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: donePercentage == 1 && widget.isDisplayed ? .7 : 0,
            curve: Curves.easeInOutCirc,
            child: ColoredBox(
              color: widget
                  .myTheme.taskButtonColors.taskButtonCompletedBackgroundColor,
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

          AnimatedOpacity(
            duration: Duration(milliseconds: widget.isDisplayed ? 700 : 150),
            opacity: widget.isDisplayed ? 1 : 0,
            curve: Curves.easeIn,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // running icon
                  CustomTaskButtonTitleWidget(
                    icon: IconData(widget.task.iconCode),
                    taskName: widget.task.title,
                    isActivated: widget.isActivated,
                  ),

                  //text
                  Column(
                    children: [
                      // To avoid "column rendredflex overflowed" have to use *Expanded*
                      // or *Flexible* widgets, the i used it in the code bellow
                      Expanded(
                        child: Container(
                          height: 50,
                          width: 110,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: widget.myTheme.taskButtonColors
                                  .taskButtonActivatedBackgroundColor,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                          child: Center(
                            child: Text(widget.task.title,
                                textDirection: ui.TextDirection.rtl,
                                style: TextStyle(
                                    color: widget.foregroundColor,
                                    fontSize: 15,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                        ),
                      ),

                      // task goal
                      Expanded(
                        child: Center(
                          child: Text(
                            widget.task.goal == null
                                ? '5'
                                : DateFormat(widget.task.goal.toString())
                                    .format(DateTime.now()),
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                letterSpacing: 10,
                                fontSize: 20,
                                color: widget.foregroundColor,
                                shadows: const [
                                  Shadow(
                                      color: Colors.black,
                                      blurRadius: 2,
                                      offset: Offset(1, 1))
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Icon and percentage section
                  CustomTaskButtonPercentageIcon(
                    goal: widget.task.goal!,
                    spentTime:
                        Duration(milliseconds: widget.task.totalSpentTime!),
                    donePercentage: donePercentage,
                    foreground: widget.foregroundColor,
                    icon: IconData(widget.task.iconCode),
                    taskColor: Color(widget.task.colorCode),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
