import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zamaan/utilities/enums.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/widgets/custom_task_button_widget_components/custom_task_button_percentage_icon.dart';
import 'package:zamaan/widgets/custom_task_button_widget_components/custom_task_button_running_icon_widget.dart';
import 'package:zamaan/widgets/custom_task_button_widget_components/custom_task_button_tile_sizes/big_task_button.dart';
import 'package:zamaan/widgets/custom_task_button_widget_components/custom_task_button_tile_sizes/small_task_button.dart';
import 'package:zamaan/widgets/custom_widgets.dart';

import '../../utilities/providers/providers.dart';

class CustomTaskButtonHeaderWidget extends StatefulWidget {
  final String taskName;
  final Color backgroundColor;
  final Color foreground;
  final Color iconColor;
  final IconData icon;
  final bool canOpenOptionsSection;
  final bool isDisplayed;
  final int index;
  final CustomThemeExtension myTheme;
  final double donePercentage;
  final void Function(int, bool) onSelectedTaskChanged;

  const CustomTaskButtonHeaderWidget(
      {super.key,
      required this.backgroundColor,
      required this.foreground,
      required this.iconColor,
      required this.icon,
      required this.taskName,
      required this.canOpenOptionsSection,
      required this.isDisplayed,
      required this.index,
      required this.myTheme,
      required this.donePercentage,
      required this.onSelectedTaskChanged});

  @override
  State<CustomTaskButtonHeaderWidget> createState() =>
      _CustomTaskButtonHeaderWidgetState();
}

class _CustomTaskButtonHeaderWidgetState
    extends State<CustomTaskButtonHeaderWidget> {
  late CustomThemeExtension myTheme =
      Provider.of<ThemeProvider>(context).myTheme(context);

  late Color backgroundColor = myTheme.taskButtonBackgroundColor;
  late Color foreground = myTheme.taskButtonForegroundColor;
  late bool isActivated = false;
  late bool isStillHovered = false;
  late MouseCursor cursor = SystemMouseCursors.click;
  late ButtonStates buttonState = ButtonStates.exited;

  @override
  Widget build(BuildContext context) {
    TaskTileSizes taskTileSize =
        Provider.of<ChangeTaskTileSizeProvider>(context).tileSize;
    CustomThemeExtension myTheme =
        Provider.of<ThemeProvider>(context).myTheme(context);
    return RawCustomButtonWidget(
        onHover: (onHovering) {
          if (onHovering) stateUpdater(ButtonStates.hoverd);
        },
        onExit: (onExit) {
          if (onExit) stateUpdater(ButtonStates.exited);
        },
        onTap: (onTap) {
          stateUpdater(ButtonStates.tapped);
        },
        onLongPress: (onLongPress) {
          stateUpdater(ButtonStates.longPressed);
          // _onLongPressTimer = Timer(const Duration(milliseconds: 500), () {
          //   stateUpdater(ButtonStates.tapDown);
          // });
        },
        cursor: cursor,
        child: taskTileSize == TaskTileSizes.big
            ? BigTaskButtonTile(
                isDisplayed: widget.isDisplayed,
                myTheme: myTheme,
                canOpenOptionsSection: widget.canOpenOptionsSection,
                taskName: widget.taskName,
                foreground: foreground,
                donePercentage: widget.donePercentage,
                icon: widget.icon,
                iconColor: widget.iconColor,
                isActivated: isActivated)
            : SmallTaskButtonTile(
                isDisplayed: widget.isDisplayed,
                myTheme: myTheme,
                canOpenOptionsSection: widget.canOpenOptionsSection,
                taskName: widget.taskName,
                foreground: foreground,
                donePercentage: widget.donePercentage,
                icon: widget.icon,
                iconColor: widget.iconColor,
                isActivated: isActivated));
  }

  void stateUpdater(ButtonStates state) => setState(() {
        buttonState = state;
        switch (state) {
          case ButtonStates.exited:
            {
              backgroundColor = isActivated
                  ? myTheme.taskButtonActivatedBackgroundColor
                  : myTheme.taskButtonBackgroundColor;
              isStillHovered = false;
              break;
            }
          case ButtonStates.hoverd:
            {
              backgroundColor = myTheme.taskButtonHoverdBackgroundColor;
              isStillHovered = true;
              break;
            }

          case ButtonStates.tapped:
            {
              if (isActivated) {
                isActivated = !isActivated;
                backgroundColor = isStillHovered
                    ? myTheme.taskButtonHoverdBackgroundColor
                    : myTheme.taskButtonBackgroundColor;
              } else {
                isActivated = !isActivated;
                backgroundColor = myTheme.taskButtonActivatedBackgroundColor;
              }
              break;
            }

          case ButtonStates.longPressed:
            {
              if (widget.canOpenOptionsSection) {
                widget.onSelectedTaskChanged(widget.index, true);
              }

              break;
            }

          default:
            break;
        }
      });
}
