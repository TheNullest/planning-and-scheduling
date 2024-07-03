// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:zamaan/data/models.dart';
// import 'package:zamaan/themes/themes.dart';
// import 'package:zamaan/utilities/providers/theme_provider.dart';
// import 'package:zamaan/views/abstracts/asbtract_base_view.dart';
// import 'package:zamaan/widgets/custom_widgets.dart';
// import 'package:zamaan/data/data.dart';

// /// All active tasks, works, projects, plans, etc. will be displayed on this view
// class ActiveTasksView extends StatefulWidget implements BaseView {
//   const ActiveTasksView({super.key});

//   static String get routeName => 'active-tasks-view';

//   @override
//   State<ActiveTasksView> createState() => _ActiveTasksViewState();

//   @override
//   String get viewTitle => 'برنامه های جاری';

//   @override
//   IconData get icon => Icons.workspaces;
// }

// class _ActiveTasksViewState extends State<ActiveTasksView> {
//   late int selectedTaskIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     final List<MainTaskModel> mainTasksProvider =
//         context.watch<ProjectModelProvider>().tasks;

//     final CustomThemeExtension myTheme =
//         Provider.of<ThemeProvider>(context).myTheme(context);
//     return ListView.builder(
//         padding: const EdgeInsets.all(0),
//         itemCount: mainTasksProvider.length,
//         itemBuilder: (context, index) {
//           final task = mainTasksProvider[index];
//           return Visibility(
//             visible: !task.isDone,
//             child: CustomTaskButtonWidget(
//               task: task,
//               donePercentage: Random().nextDouble() * 1,
//               index: index,
//               isDisplayable:
//                   selectedTaskIndex > -1 && selectedTaskIndex == index ||
//                       selectedTaskIndex == -1,
//               myTheme: myTheme,
//               onSelectedTaskChanged: (selectedTaskChanged) => setState(() {
//                 selectedTaskIndex = selectedTaskChanged;
//               }),
//             ),
//           );
//         });
//   }
// }
