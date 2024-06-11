import 'package:flutter/material.dart';
import 'package:zamaan/utilities/enums.dart';
import 'package:zamaan/model/models.dart';

class MainTaskModel {
  final int id;
  final UserModel creatorId;
  final String mainTaskName;
  final DateTime creationDate;
  final Color color;
  final IconData icon;
  final Importance importance;
  final String? description;
  final DateTime? deadline;
  final RepetitionInterval? repeat;
  final List<SubTaskModel>? subtasks;
  List<TaskDoingTimeFrameModel>? timeFrames;

  /// Groups such as : sport, reading, working, fun ,...
  final GorupModel groupId;
  final List<int>? fixedTagsId;
  final List<int>? tagsId;

  /// Doing work with the presence and help of other people
  final List<int>? contributorsId;

  /// When a project is planned and divided into smaller tasks
  final int? parentMainTaskId;

  /// Selected days of the week to repeat the task
  final List<SelectedWeekDaysModel>? repititionOnWeekDays;

  /// If the task is completed\
  /// and there is no need to repeat it
  final bool isDone;

  MainTaskModel({
    required this.id,
    this.timeFrames,
    required this.creatorId,
    required this.mainTaskName,
    required this.groupId,
    required this.creationDate,
    required this.color,
    required this.icon,
    required this.importance,
    this.fixedTagsId,
    this.tagsId,
    this.subtasks,
    this.contributorsId,
    this.description,
    this.parentMainTaskId,
    this.deadline,
    this.repeat,
    this.repititionOnWeekDays,
    this.isDone = false,
  });
}
