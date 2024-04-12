import 'package:flutter/material.dart';
import 'package:zamaan/views/dialog_views/add_task_dialog_view.dart';

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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          color: Colors.white,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            elevation: MaterialStateProperty.all(3),
            overlayColor: MaterialStateProperty.all(Colors.grey.shade900),
          ),
          onPressed: () => showDialog(
                context: context,
                builder: (context) => AddTaskDialogView(
                  taskNameTextController: widget.taskNameTextController,
                  descriptionTextController: widget.descriptionTextController,
                ),
              ),
          icon: const Icon(
            Icons.add,
            size: 20,
          )),
    );
  }
}
