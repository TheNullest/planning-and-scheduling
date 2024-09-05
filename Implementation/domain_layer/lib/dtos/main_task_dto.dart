import 'package:data_layer/models/main_task_model.dart';
import 'package:domain_layer/dtos/dto_abstract.dart';
import 'package:domain_layer/dtos/selected_week_days_dto.dart';
import 'package:domain_layer/enums.dart';
import 'package:uuid/uuid.dart';

class MainTaskDTO extends BaseDTOAbstraction<MainTaskModel> {
  final String title;

  final DateTime creationDate;

  /// Store the color value as an integer
  final int colorCode;

  ///Instead of saving the entire icon, save its IconData
  final int iconCode;

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
      required this.colorCode,
      required this.iconCode,
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

  factory MainTaskDTO.fromModel({required MainTaskModel model}) => MainTaskDTO(
        id: model.id,
        description: model.description,
        creatorId: model.creatorId,
        title: model.title,
        taskCategoriesId: model.taskCategoriesId,
        creationDate: model.creationDate,
        colorCode: model.colorCode,
        iconCode: model.iconCode,
        priority: Priority.fromIndex(model.priority),
        completed: model.completed,
        contributorsId: model.contributorsId,
        dueTime: model.dueTime,
        fixedTagsId: model.fixedTagsId,
        repetitionInterval:
            RepetitionInterval.fromIndex(model.repetitionInterval!),
        superMainTaskId: model.superMainTaskId,
        tagsId: model.tagsId,
        totalSpentTime: Duration(milliseconds: model.totalSpentTime!),
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
        colorCode: colorCode,
        iconCode: iconCode,
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
