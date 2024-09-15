// import 'package:zamaan/core/entities/base_entity_abstraction.dart';
// import 'package:zamaan/core/utils/enums.dart';
// import 'package:zamaan/features/main_task/domain/entities/goal_entity.dart';
// import 'package:zamaan/features/main_task/domain/entities/selected_week_days_entity.dart';

// class MainTaskEntity extends BaseEntityAbstraction {
//   final String title;

//   final DateTime creationDate;

//   /// Store the color value as an integer
//   final int colorCode;

//   ///Instead of saving the entire icon, save its IconData
//   final int iconCode;

//   final Priority priority;

//   final DateTime? dueTime;

//   final RepetitionInterval? repetitionInterval;

//   /// Groups such as : sport, reading, working, fun ,...
//   final List<String>? taskCategoriesId;

//   final List<String>? fixedTagsId;

//   final List<String>? tagsId;

//   /// Doing work with the presence and help of other people
//   final List<String>? contributorsId;

//   /// When a project is planned and divided into smaller tasks
//   final String? superMainTaskId;

//   /// Selected days of the week to repeat the task
//   final SelectedWeekDaysEntity? repititionOnWeekDays;

//   /// Store all time spent based on miliseconds in TaskDoingTimFrameModels
//   final Duration? totalSpentTime;

//   final GoalEntity? goal;

//   /// If the task is completed\
//   /// and there is no need to repeat it
//   final bool completed;

//   const MainTaskEntity({
//     super.id,
//     super.creatorId,
//     super.description,
//     required this.title,
//     required this.taskCategoriesId,
//     required this.creationDate,
//     required this.colorCode,
//     required this.iconCode,
//     required this.priority,
//     required this.completed,
//     this.fixedTagsId,
//     this.tagsId,
//     this.contributorsId,
//     this.superMainTaskId,
//     this.dueTime,
//     this.repetitionInterval,
//     this.repititionOnWeekDays,
//     this.totalSpentTime,
//     this.goal,
//   });

//   @override
//   List<Object?> get props => [id];
// }
