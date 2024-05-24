import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/themes/themes.dart';
import 'package:zamaan/utilities/providers/theme_provider.dart';
import 'package:zamaan/views/dialogs/add_task_dialog.dart';
import 'package:zamaan/widgets/raws/raw_custom_button_widget.dart';

class CustomAddTaskDialogButton extends StatefulWidget {
  final TextEditingController taskNameTextController;
  final TextEditingController descriptionTextController;

  const CustomAddTaskDialogButton(
      {super.key,
      required this.taskNameTextController,
      required this.descriptionTextController});
  @override
  State<CustomAddTaskDialogButton> createState() =>
      _CustomAddTaskDialogButtonState();
}

class _CustomAddTaskDialogButtonState extends State<CustomAddTaskDialogButton> {
  late CustomThemeExtension myTheme =
      Provider.of<ThemeProvider>(context).myTheme(context);
  late Color backgroundColor = myTheme.buttonBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final myTheme = context.watch<ThemeProvider>().myTheme(context);
    return RawCustomButtonWidget(
      onHover: (onHovering) {
        setState(() {
          backgroundColor = onHovering
              ? myTheme.buttonHoverdBackgroundColor
              : myTheme.buttonBackgroundColor;
        });
      },
      onTapDown: (onPressing) {
        showDialog(
            context: context,
            builder: (context) => AddTaskDialog(
                  descriptionTextController: TextEditingController(),
                  taskNameTextController: TextEditingController(),
                ));
        setState(() {
          backgroundColor = onPressing
              ? myTheme.buttonPressedBackgroundColor
              : myTheme.buttonBackgroundColor;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0, 2),
                  blurRadius: 15,
                  spreadRadius: 0)
            ]),
        child: Icon(
          Icons.add,
          size: 20,
          color: myTheme.buttonForegroundColor,
        ),
      ),
    );
  }
}
