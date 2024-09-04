import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamaan/models/task_category_model.dart';
import 'package:zamaan/models/main_task_model.dart';
import 'package:zamaan/repositories/hive_task_category_repo.dart';
import 'package:zamaan/repositories/hive_main_task_repo.dart';
import 'package:zamaan/utilities/date_time_helper.dart';
import 'package:zamaan/utilities/enums.dart';
import 'package:zamaan/utilities/utilities.dart';
import 'package:zamaan/view_models/main_task_view_model.dart';
import 'package:zamaan/views/widgets/custom_widgets.dart';

class AddTaskDialog extends StatefulWidget {
  final TextEditingController taskNameTextController;
  final TextEditingController descriptionTextController;

  const AddTaskDialog(
      {super.key,
      required this.taskNameTextController,
      required this.descriptionTextController});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  late MainTaskViewModel mainTaskProvider;

  final DateTimeHelper selectedCreationDateTime = DateTimeHelper();
  final DateTimeHelper selectedDueDateTime = DateTimeHelper.customDateTime(
      DateTime.now().add(const Duration(days: 1)));

  late DateTime creationDateTime;
  late DateTime dueDate;

  String? creationDateToString;
  String? dueDateTimeToString;

  RepetitionInterval? selectedRepetition = RepetitionInterval.daily;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainTaskProvider = Provider.of<MainTaskViewModel>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<TaskCategoryModel>> _getGroups() async =>
      await HiveCategoryRepo().getAll();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 25),
                  child: Column(
                    children: [
                      /// Creation DateTime
                      CustomDateTimePickerWidget(
                        title: 'زمان ایجاد',
                        selectedDateTime: selectedCreationDateTime,
                      ),

                      /// Due DateTime
                      CustomDateTimePickerWidget(
                        title: 'زمان سررسید',
                        selectedDateTime: selectedDueDateTime,
                      ),

                      15.0.sizedBoxHeight,

                      /// Task Name
                      CustomTextFieldWidget(
                        controller: widget.taskNameTextController,
                        hintText: 'نام کار جدید را وارد کنید',
                      ),

                      /// Task Description
                      CustomTextFieldWidget(
                        controller: widget.descriptionTextController,
                        hintText: 'توضیحات',
                        isExpandable: true,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                      ),

                      /// Select Contributers
                      CustomNormalButtonWidget(
                        text: 'انتخاب مشارکت کننده',
                        onPressed: () => showDialogBox(Dialog(
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(5)),
                            // child: ListView.builder(
                            //     itemCount: users.length,
                            //     itemBuilder: (context, index) {
                            //       final user = users[index];
                            //       return Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //             horizontal: 20, vertical: 10),
                            //         child: Text(user.firstName),
                            //       );
                            //     }),
                          ),
                        )),
                      ),
                      15.0.sizedBoxHeight,

                      /// Select repitition interval
                      DropdownButton<RepetitionInterval>(
                        value: selectedRepetition,
                        onChanged: (newValue) {
                          setState(() {
                            selectedRepetition = newValue;
                          });
                        },
                        items: RepetitionInterval.values.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item.toString()),
                            onTap: () {
                              selectedRepetition = item;
                            },
                          );
                        }).toList(),
                      ),
                      15.0.sizedBoxHeight,

                      /// Select groups
                      CustomNormalButtonWidget(
                          text: 'گروه بندی',
                          onPressed: () => showDialogBox(
                                Dialog(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.surface,
                                    insetPadding: const EdgeInsets.all(25),
                                    child: Container(
                                      height: 400,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          borderRadius:
                                              BorderRadius.circular(5)),

                                      /// TODO #5 A separate widget must be created to display, create, edit or delete groups
                                      child: FutureBuilder<
                                              List<TaskCategoryModel>>(
                                          future: _getGroups(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              final List<TaskCategoryModel>
                                                  groups = snapshot.data!;
                                              return DropdownButton<
                                                  TaskCategoryModel>(
                                                onChanged: (newValue) {
                                                  setState(() {});
                                                },
                                                items: groups
                                                    .map((group) =>
                                                        DropdownMenuItem(
                                                          value: group,
                                                          child: Text(
                                                              group.title!),
                                                        ))
                                                    .toList(),
                                              );
                                            } else if (snapshot.hasError) {
                                              // Handle any errors that might occur during group retrieval
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            }
                                            // Display a loading indicator while waiting for data
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }),
                                    )),
                              )),
                      15.0.sizedBoxHeight,

                      /// Select tags
                      CustomNormalButtonWidget(
                        text: 'تگ',
                        onPressed: () => showDialogBox(Dialog(
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          insetPadding: const EdgeInsets.all(25),
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(5)),

                            /// TODO #6 A separate widget must be created to display, create, edit or delete tags
                            // child: ListView.builder(
                            //     itemCount: tags.length,
                            //     itemBuilder: (context, index) {
                            //       final tag = tags[index];
                            //       return Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //             horizontal: 20, vertical: 10),
                            //         child: Text(tag.tagName),
                            //       );
                            //     }),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            10.0.sizedBoxHeight,

            /// Confirm and cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomNormalButtonWidget(
                  onPressed: exitDialog,
                  text: 'انصراف',
                  minWidth: 100,
                ),
                CustomNormalButtonWidget(
                  onPressed: _createNewTask,
                  text: 'تایید',
                  minWidth: 100,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _createNewTask() async {
    try {
      await mainTaskProvider.addEntity(
        newEntity: MainTaskModel.create(
          title: widget.taskNameTextController.text,
          description: widget.descriptionTextController.text,
          taskCategories: [],
          timeIntervals: [],
          creationDate: selectedCreationDateTime.dateTime,
          deadline: selectedDueDateTime.dateTime,
          colorCode: Colors.red.value,
          iconCode: Icons.groups.codePoint,
          repeat: selectedRepetition!.index,
          importance: Priority.important.index,
        ),
      );

      // Perform any cleanup actions (optional)
      widget.taskNameTextController
          .clear(); // Clear text controller after saving
      widget.descriptionTextController.clear();
      if (mounted) Navigator.pop(context);
    } catch (error) {
      // Handle errors (e.g., display error message)
      log('Error saving task: $error');
    }
  }

  void exitDialog() {
    Navigator.pop(context);
    widget.taskNameTextController.clear();
  }

  void showDialogBox(Dialog dialog) =>
      showDialog(context: context, builder: (context) => dialog);
}
