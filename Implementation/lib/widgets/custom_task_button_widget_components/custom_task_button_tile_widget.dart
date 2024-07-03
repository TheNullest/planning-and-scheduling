import 'package:flutter/material.dart';
import 'package:zamaan/data/models.dart';
import 'package:zamaan/utilities/enums.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/utilities/providers/providers.dart';
import 'package:zamaan/utilities/responsive_helper.dart';
import 'package:zamaan/widgets/custom_task_button_widget_components/custom_task_button_tile_sizes/big_task_button_tile.dart';
import 'package:zamaan/widgets/custom_task_button_widget_components/custom_task_button_tile_sizes/small_task_button_tile.dart';
import 'package:zamaan/widgets/custom_widgets.dart';

class CustomTaskButtonTileWidget extends StatefulWidget {
  final MainTaskModel task;
  final Color backgroundColor;
  final Color foreground;
  final bool canOpenOptionsSection;
  final bool isDisplayed;
  final int index;
  final CustomThemeExtension myTheme;
  final void Function(int, bool) onSelectedTaskChanged;
  final void Function(bool) onTaskActivated;

  const CustomTaskButtonTileWidget({
    super.key,
    required this.backgroundColor,
    required this.foreground,
    required this.canOpenOptionsSection,
    required this.isDisplayed,
    required this.index,
    required this.myTheme,
    required this.onSelectedTaskChanged,
    required this.onTaskActivated,
    required this.task,
  });

  @override
  State<CustomTaskButtonTileWidget> createState() =>
      _CustomTaskButtonTileWidgetState();
}

class _CustomTaskButtonTileWidgetState
    extends State<CustomTaskButtonTileWidget> {
  late Color backgroundColor = widget.myTheme.taskButtonBackgroundColor;
  late Color foregroundColor = widget.myTheme.taskButtonForegroundColor;
  late bool taskActivated = false;
  late bool isStillHovered = false;
  late MouseCursor cursor = SystemMouseCursors.click;
  late ButtonStates buttonState = ButtonStates.exited;
  late bool isMobiledevice = ResponsiveHelper.isMobileDevice(context);
  @override
  Widget build(BuildContext context) {
    TaskTileSizes taskTileSize =
        Provider.of<ChangeTaskTileSizeProvider>(context).tileSize;

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
        if (isMobiledevice) {
          stateUpdater(ButtonStates.longPressed);
        }
        // _onLongPressTimer = Timer(const Duration(milliseconds: 500), () {
        //   stateUpdater(ButtonStates.tapDown);
        // });
      },
      onDoubleTap: () {
        if (!isMobiledevice) {
          stateUpdater(ButtonStates.longPressed);
        }
      },
      cursor: cursor,
      child: taskTileSize == TaskTileSizes.big
          ? BigTaskButtonTile(
              task: widget.task,
              isDisplayed: widget.isDisplayed,
              myTheme: widget.myTheme,
              canOpenOptionsSection: widget.canOpenOptionsSection,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor,
              isActivated: taskActivated)
          : SmallTaskButtonTile(
              task: widget.task,
              isDisplayed: widget.isDisplayed,
              myTheme: widget.myTheme,
              canOpenOptionsSection: widget.canOpenOptionsSection,
              foregroundColor: foregroundColor,
              isActivated: taskActivated,
              backgroundColor: backgroundColor,
            ),
    );
  }

  void stateUpdater(ButtonStates state) => setState(() {
        buttonState = state;
        switch (state) {
          case ButtonStates.exited:
            {
              backgroundColor = taskActivated
                  ? widget.myTheme.taskButtonActivatedBackgroundColor
                  : widget.myTheme.taskButtonBackgroundColor;
              isStillHovered = false;
              break;
            }
          case ButtonStates.hoverd:
            {
              backgroundColor = widget.myTheme.taskButtonHoverdBackgroundColor;
              isStillHovered = true;
              break;
            }

          case ButtonStates.tapped:
            {
              if (taskActivated) {
                taskActivated = !taskActivated;
                backgroundColor = isStillHovered
                    ? widget.myTheme.taskButtonHoverdBackgroundColor
                    : widget.myTheme.taskButtonBackgroundColor;
              } else {
                taskActivated = !taskActivated;
                backgroundColor =
                    widget.myTheme.taskButtonActivatedBackgroundColor;
              }
              widget.onTaskActivated.call(taskActivated);
              break;
            }

          case ButtonStates.longPressed:
            {
              if (widget.canOpenOptionsSection) {
                widget.onSelectedTaskChanged(widget.index, true);
                Provider.of<HideUnhideBarsProvider>(context, listen: false)
                    .barsDisplay = false;
              }

              break;
            }

          default:
            break;
        }
      });
}
