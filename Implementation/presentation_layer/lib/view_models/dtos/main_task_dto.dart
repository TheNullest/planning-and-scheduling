import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:zamaan/models/main_task_model.dart';
import 'package:zamaan/utilities/enums.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';
import 'package:zamaan/view_models/dtos/dtos.dart';

class MainTaskDTO extends DTOAbstraction<MainTaskModel> {
  final String title;

  final DateTime creationDate;

  /// Store the color value as an integer
  final IconData color;

  ///Instead of saving the entire icon, save its IconData
  final Color icon;

  final Priority priority;

  final DateTime? dueTime;

  final RepetitionInterval? repetitionInterval;

  /// Groups such as : sport, reading, working, fun ,...
  final List<String>? taskCategoriesId;

  final List<String>? fixedTagsId;

  final List<String>? tagsId;

  /// Doing work with the presence and help of other people
  final List<String>? contributorsId;

  /// When a project is planned and divided into smaller tasks
  final String? superMainTaskId;

  /// Selected days of the week to repeat the task
  final SelectedWeekDaysDTO? repititionOnWeekDays;

  /// Store all time spent based on miliseconds in TaskDoingTimFrameModels
  Duration? totalSpentTime = const Duration(microseconds: 0);

  /// If the task is completed\
  /// and there is no need to repeat it
  bool completed = false;

  MainTaskDTO(
      {required super.id,
      super.creatorId,
      super.description,
      required this.title,
      required this.taskCategoriesId,
      required this.creationDate,
      required this.color,
      required this.icon,
      required this.priority,
      this.fixedTagsId,
      this.tagsId,
      this.contributorsId,
      this.superMainTaskId,
      this.dueTime,
      this.repetitionInterval,
      this.repititionOnWeekDays,
      this.totalSpentTime,
      this.completed = false});

  var d = Priority.critical.index;

  factory MainTaskDTO.fromModel({required MainTaskModel mainTaskModel}) =>
      MainTaskDTO(
        id: mainTaskModel.id,
        description: mainTaskModel.description,
        creatorId: mainTaskModel.creatorId,
        title: mainTaskModel.title,
        taskCategoriesId: mainTaskModel.taskCategoriesId,
        creationDate: mainTaskModel.creationDate,
        color: IconData(mainTaskModel.colorCode),
        icon: Color(mainTaskModel.iconCode),
        priority: Priority.fromIndex(mainTaskModel.priority),
        completed: mainTaskModel.completed,
        contributorsId: mainTaskModel.contributorsId,
        dueTime: mainTaskModel.dueTime,
        fixedTagsId: mainTaskModel.fixedTagsId,
        repetitionInterval:
            RepetitionInterval.fromIndex(mainTaskModel.repetitionInterval!),
        superMainTaskId: mainTaskModel.superMainTaskId,
        tagsId: mainTaskModel.tagsId,
        totalSpentTime: Duration(milliseconds: mainTaskModel.totalSpentTime!),
      );

  @override
  MainTaskModel toModel() => MainTaskModel(
        id: const Uuid().v4(),
        creatorId: creatorId,
        description: description,
        title: title,
        taskCategoriesId: taskCategoriesId,
        contributorsId: contributorsId,
        creationDate: creationDate,
        colorCode: color.codePoint,
        iconCode: icon.value,
        priority: priority.index,
        repetitionInterval: repetitionInterval!.index,
        superMainTaskId: superMainTaskId,
        totalSpentTime: totalSpentTime!.inMilliseconds,
        tagsId: tagsId,
        fixedTagsId: fixedTagsId,
        completed: completed,
        dueTime: dueTime,
      );
}
