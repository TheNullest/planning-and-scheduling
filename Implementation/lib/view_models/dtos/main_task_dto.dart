import 'package:flutter/material.dart';
import 'package:zamaan/models/main_task_model.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';
import 'package:zamaan/view_models/dtos/dtos.dart';

class MainTaskDTO extends DTOAbstract<MainTaskModel> {
  final String creatorId;

  final String title;

  final DateTime creationDate;

  /// Store the color value as an integer
  final IconData color;

  ///Instead of saving the entire icon, save its IconData
  final Color icon;

  final int importance;

  final String? description;

  final DateTime? deadline;

  final int? repeat;

  List<ScheduledTaskTimeIntervalDTO>? scheduledTimeFrames;

  List<TaskDoingTimeIntervalDTO>? timeIntervals;

  /// Groups such as : sport, reading, working, fun ,...
  final List<TaskCategoryDTO>? taskCategories;

  final List<TagDTO>? fixedTags;

  final List<TagDTO>? tags;

  /// Doing work with the presence and help of other people
  final List<UserDTO>? contributors;

  /// When a project is planned and divided into smaller tasks
  final List<MainTaskDTO>? subMainTasks;
  final List<SubTaskDTO>? subTasks;

  /// Selected days of the week to repeat the task
  final SelectedWeekDaysDTO? repititionOnWeekDays;

  /// Store all time spent based on miliseconds in TaskDoingTimFrameModels
  int? totalSpentTime;

  /// If the task is completed\
  /// and there is no need to repeat it
  bool completed = false;

  MainTaskDTO(
      {required super.id,
      required this.creatorId,
      required this.title,
      required this.taskCategories,
      required this.creationDate,
      required this.color,
      required this.icon,
      required this.importance,
      this.timeIntervals,
      this.fixedTags,
      this.tags,
      this.contributors,
      this.description,
      this.subMainTasks,
      this.subTasks,
      this.deadline,
      this.repeat,
      this.repititionOnWeekDays,
      this.totalSpentTime = 0,
      this.scheduledTimeFrames,
      this.completed = false});

  factory MainTaskDTO.fromModel({
    required MainTaskModel mainTaskModel,
    List<ScheduledTaskTimeIntervalDTO>? scheduledTimeFrames,
    List<TaskDoingTimeIntervalDTO>? timeIntervals,
    List<TaskCategoryDTO>? taskCategories,
    List<TagDTO>? fixedTags,
    List<TagDTO>? tags,
    List<UserDTO>? contributorsId,
    List<MainTaskDTO>? subMainTasks,
    List<SubTaskDTO>? subTasks,
    SelectedWeekDaysDTO? repititionOnWeekDays,
  }) =>
      MainTaskDTO(
          id: mainTaskModel.id,
          creatorId: mainTaskModel.creatorId,
          title: mainTaskModel.title,
          taskCategories: taskCategories,
          creationDate: mainTaskModel.creationDate,
          color: IconData(mainTaskModel.colorCode),
          icon: Color(mainTaskModel.iconCode),
          importance: mainTaskModel.importance);

  @override
  MainTaskModel toModel() => MainTaskModel(
      id: id,
      creatorId: creatorId,
      title: title,
      taskCategoriesId: taskCategories?.map((category) => category.id).toList(),
      contributorsId: contributors?.map((category) => category.id).toList(),
      creationDate: creationDate,
      colorCode: color.codePoint,
      iconCode: icon.value,
      importance: importance);
}
