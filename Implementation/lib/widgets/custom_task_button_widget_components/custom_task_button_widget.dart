import 'package:flutter/material.dart';
import 'package:zamaan/model/main_task_model.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/utilities/utilities.dart';
import 'package:zamaan/widgets/custom_task_button_widget_components/custom_task_button_header_widget.dart';
import 'package:zamaan/widgets/custom_task_button_widget_components/custom_task_button_options_widget.dart';

class CustomTaskButtonWidget extends StatefulWidget {
  final double donePercentage;
  final int index;
  final MainTaskModel task;
  final CustomThemeExtension myTheme;

  /// A value to determine whether or not to show the widget
  /// after checking if another button is selected and open
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
  late Color backgroundColor = widget.myTheme.taskButtonBackgroundColor;
  late Color foregroundColor = widget.myTheme.taskButtonForegroundColor;
  late bool isActivated = false;
  late bool isSelected = false;
  late bool isStillHovered = false;
  late MouseCursor cursor = SystemMouseCursors.click;
  late bool opensOptionsSection = false;
  late bool isOptionsSectionCompletelyOpened = false;
  late double widgetHeigth;
  @override
  Widget build(BuildContext context) {
    widgetHeigth = ResponsiveHelper.screenUsableHeight(context) - 20;
    if (widgetHeigth < 500) widgetHeigth = 500;
    return AnimatedContainer(
        duration: Duration(
          milliseconds: isOptionsSectionCompletelyOpened && opensOptionsSection
              ? 0
              : opensOptionsSection
                  ? 100
                  : 200,
        ),
        curve: Curves.easeInOut,
        height: widget.isDisplayable
            ? opensOptionsSection
                ? widgetHeigth
                : 70
            : 0,
        margin: EdgeInsets.only(
            bottom: widget.isDisplayable ? 10 : 0,
            top: widget.index == 0 ? 10 : 0,
            left: 10,
            right: 10),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(15)),
        child: Column(children: [
          // header
          CustomTaskButtonHeaderWidget(
              taskName: widget.task.mainTaskName,
              index: widget.index,
              isDisplayed: widget.isDisplayable,
              onSelectedTaskChanged: (index, opensOptionsSection) =>
                  setState(() {
                    this.opensOptionsSection = opensOptionsSection;
                    widget.onSelectedTaskChanged(index);
                  }),
              backgroundColor: backgroundColor,
              foreground: foregroundColor,
              iconColor: widget.task.color,
              icon: widget.task.icon,
              donePercentage: widget.donePercentage,
              canOpenOptionsSection: !opensOptionsSection,
              myTheme: widget.myTheme),

          // options section
          CustomTaskButtonOptionsWidget(
              myTheme: widget.myTheme,
              optionsSectionClosed: () => setState(() {
                    opensOptionsSection = false;
                    widget.onSelectedTaskChanged(-1);
                  }),
              opensOptionsSection: opensOptionsSection)
        ]),
        onEnd: () => {isOptionsSectionCompletelyOpened = opensOptionsSection});
  }
}
