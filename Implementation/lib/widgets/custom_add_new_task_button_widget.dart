// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:zamaan/themes/themes.dart';
// import 'package:zamaan/utilities/providers/theme_provider.dart';
// import 'package:zamaan/views/dialogs/add_task_dialog.dart';
// import 'package:zamaan/widgets/raws/raw_custom_button_widget.dart';

// class CustomAddNewTaskButtonWidget extends StatefulWidget {
//   final TextEditingController taskNameTextController;
//   final TextEditingController descriptionTextController;

//   const CustomAddNewTaskButtonWidget(
//       {super.key,
//       required this.taskNameTextController,
//       required this.descriptionTextController});
//   @override
//   State<CustomAddNewTaskButtonWidget> createState() =>
//       _CustomAddNewTaskButtonWidgetState();
// }

// class _CustomAddNewTaskButtonWidgetState
//     extends State<CustomAddNewTaskButtonWidget> {
//   late CustomThemeExtension myTheme =
//       Provider.of<ThemeProvider>(context).myTheme(context);
//   late Color backgroundColor = myTheme.buttonBackgroundColor;

//   @override
//   Widget build(BuildContext context) {
//     final myTheme = context.watch<ThemeProvider>().myTheme(context);
//     return RawCustomButtonWidget(
//       onHover: (hovered) {
//         setState(() {
//           backgroundColor = myTheme.buttonHoverdBackgroundColor;
//         });
//       },
//       onExit: (exited) {
//         setState(() {
//           backgroundColor = myTheme.buttonBackgroundColor;
//         });
//       },
//       onTapDown: (tapped) {
//         setState(() {
//           backgroundColor = tapped
//               ? myTheme.buttonPressedBackgroundColor
//               : myTheme.buttonBackgroundColor;
//         });
//       },
//       onTapUp: (tapUp) {
//         showDialog(
//             context: context,
//             builder: (context) => AddTaskDialog(
//                   descriptionTextController: TextEditingController(),
//                   taskNameTextController: TextEditingController(),
//                 ));
//       },
//       onLongPressEnd: (pressingEnded) {
//         showDialog(
//             context: context,
//             builder: (context) => AddTaskDialog(
//                   descriptionTextController: TextEditingController(),
//                   taskNameTextController: TextEditingController(),
//                 ));
//       },
//       child: Container(
//         padding: const EdgeInsets.all(5),
//         decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: backgroundColor,
//             boxShadow: const [
//               BoxShadow(color: Colors.black54, blurRadius: 20, spreadRadius: 1)
//             ]),
//         child: Icon(
//           Icons.add,
//           size: 20,
//           color: myTheme.buttonForegroundColor,
//         ),
//       ),
//     );
//   }
// }
