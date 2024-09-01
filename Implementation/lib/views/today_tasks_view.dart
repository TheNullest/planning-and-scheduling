import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:zamaan/models/models.dart';
import 'package:zamaan/utilities/themes/themes.dart';
import 'package:zamaan/utilities/providers/providers.dart';
import 'package:zamaan/view_models/main_task_view_model.dart';
import 'package:zamaan/views/abstracts/asbtract_base_view.dart';
import 'package:zamaan/views/widgets/custom_widgets.dart';

/// All tasks, works, projects, plans, etc. for today will be displayed on this view
class TodaysTasksView extends StatefulWidget implements BaseView {
  const TodaysTasksView({super.key});

  @override
  State<TodaysTasksView> createState() => _TodaysTasksViewState();

  @override
  String get viewTitle => 'برنامه امروز';

  @override
  IconData get icon => Icons.timer_outlined;
}

class _TodaysTasksViewState extends State<TodaysTasksView> {
  late int selectedTaskIndex = -1;

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension myTheme =
        Provider.of<ThemeProvider>(context).myTheme(context);

    return Consumer<MainTaskViewModel>(builder: (context, viewModel, child) {
      if (viewModel.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (viewModel.entities != null && viewModel.entities!.isNotEmpty) {
        return CustomScrollView(scrollDirection: Axis.vertical, slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final MainTaskModel task = viewModel.entities![index];

              //TODO #3 correct the find the time intervals approach
              return CustomTaskButtonWidget(
                task: task,
                donePercentage: math.Random().nextDouble() * 1,
                index: index,

                isDisplayable:
                    selectedTaskIndex > -1 && selectedTaskIndex == index ||
                        selectedTaskIndex == -1,
                myTheme: myTheme,

                /// It informs which task is selected to open its main menu
                onSelectedTaskChanged: (selectedTaskChanged) => setState(() {
                  selectedTaskIndex = selectedTaskChanged;
                }),
              );
            }, childCount: viewModel.entities!.length),
          ),
        ]);
      } else {
        return const Center(child: Text('No data'));
      }
    });
  }
}

// class ExpandableMainTask extends StatefulWidget {
//   final MainTaskModel mainTask;
//   final VoidCallback onSelected; // Callback for handling selection

//   const ExpandableMainTask({
//     super.key,
//     required this.mainTask,
//     required this.onSelected,
//   });

//   @override
//   State<ExpandableMainTask> createState() => _ExpandableMainTaskState();
// }

// class _ExpandableMainTaskState extends State<ExpandableMainTask>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _expandController;
//   late Animation<double> _expandAnimation;
//   bool _isExpanded = false;

//   @override
//   void initState() {
//     super.initState();
//     _expandController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _expandAnimation = CurvedAnimation(
//       parent: _expandController,
//       curve: Curves.easeInOut,
//     )..addListener(() => setState(() {}));
//   }

//   @override
//   void dispose() {
//     _expandController.dispose();
//     super.dispose();
//   }

//   void _toggleExpand() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//       if (_isExpanded) {
//         _expandController.forward();
//         widget.onSelected(); // Call callback on selection
//       } else {
//         _expandController.reverse();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final expandedHeight = MediaQuery.of(context).size.height;
//     const collapsedHeight = 80.0; // Adjust for your desired height

//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//       height: _isExpanded ? expandedHeight : collapsedHeight,
//       child: Material(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10.0),
//         child: InkWell(
//           onTap: _toggleExpand,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 // Display your MainTaskModel data here (title, icon, etc.)
//                 Text(widget.mainTask.title),
//                 const Spacer(),
//                 Icon(
//                   _isExpanded ? Icons.expand_less : Icons.expand_more,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
