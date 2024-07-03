import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:zamaan/utilities/enums.dart';
import 'package:zamaan/data/models.dart';

part 'main_task_model.g.dart';

@HiveType(typeId: 1)
class MainTaskModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final UserModel creator;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final DateTime creationDate;

  @HiveField(4)
  final Color color;

  @HiveField(5)
  final IconData icon;

  @HiveField(6)
  final Importance importance;

  @HiveField(7)
  final String? description;

  @HiveField(8)
  final DateTime? deadline;

  @HiveField(9)
  final RepetitionInterval? repeat;

  @HiveField(10)
  final List<SubTaskModel>? subtasks;

  @HiveField(11)
  List<ScheduledTaskTimeFrame>? scheduledTimeFrames;

  @HiveField(12)
  List<TaskDoingTimeFrameModel>? timeFrames;

  /// Groups such as : sport, reading, working, fun ,...
  @HiveField(13)
  final GroupModel memberOfGroup;

  @HiveField(14)
  final List<TagModel>? fixedTags;

  @HiveField(15)
  final List<TagModel>? tags;

  /// Doing work with the presence and help of other people
  @HiveField(16)
  final List<UserModel>? contributorsId;

  /// When a project is planned and divided into smaller tasks
  @HiveField(17)
  final MainTaskModel? parentMainTask;

  /// Selected days of the week to repeat the task
  @HiveField(18)
  final List<SelectedWeekDaysModel>? repititionOnWeekDays;

  /// Storing all the spent time on the TaskDoingTimFrameModels
  @HiveField(19)
  Duration? totalSpentTime;

  @HiveField(20)
  GoalModel? goal;

  /// If the task is completed\
  /// and there is no need to repeat it
  @HiveField(21)
  bool? isDone;

  MainTaskModel.create({
    required this.title,
    required this.memberOfGroup,
    required this.creationDate,
    required this.color,
    required this.icon,
    required this.importance,
    this.timeFrames,
    this.fixedTags,
    this.tags,
    this.subtasks,
    this.contributorsId,
    this.description,
    this.parentMainTask,
    this.deadline,
    this.repeat,
    this.repititionOnWeekDays,
    this.totalSpentTime,
    this.scheduledTimeFrames,
    this.goal,
  })  : id = const Uuid().v4(),
        creator = UserModel.create(
            userName: 'userName',
            password: 'password',
            firstName: 'firstName',
            lastName: 'lastName',
            birthDate: DateTime.now(),
            emailAddress: 'emailAddress',
            profileImagePath: 'profileImagePath') {
    totalSpentTime ??= const Duration(hours: 0);
  }
  MainTaskModel({
    required this.id,
    required this.creator,
    required this.title,
    required this.memberOfGroup,
    required this.creationDate,
    required this.color,
    required this.icon,
    required this.importance,
    this.timeFrames,
    this.fixedTags,
    this.tags,
    this.subtasks,
    this.contributorsId,
    this.description,
    this.parentMainTask,
    this.deadline,
    this.repeat,
    this.repititionOnWeekDays,
    this.totalSpentTime,
    this.scheduledTimeFrames,
    this.goal,
  }) {
    totalSpentTime ??= const Duration(hours: 0);
  }
}
