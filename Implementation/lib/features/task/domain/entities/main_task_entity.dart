import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/utils/enums.dart';

class MainTaskEntity extends BaseEntityAbstraction {
  @HiveField(4)
  final String title;

  /// Store the color value as an integer
  @HiveField(5)
  final int colorCode;

  ///Instead of saving the entire icon, save its IconData
  @HiveField(6)
  final int iconCode;

  @HiveField(7)
  final Priority priority;

  @HiveField(8)
  final DateTime? dueTime;

  /// If the value of this attribute is set as weekly,\
  /// then the value of the [selectedWeekDays] must be determind
  @HiveField(9)
  final RepetitionInterval? repetitionInterval;

  /// To set this attribute, the [repetitionInterval] must be set to weekly
  @HiveField(10)
  final List<WeekDays>? selectedWeekDays;

  /// Groups such as : sporting, reading, working, fun ,...
  @HiveField(11)
  final List<String>? taskCategoriesId;

  @HiveField(12)
  final List<String>? fixedTagsId;

  @HiveField(13)
  final List<String>? tagsId;

  /// When a project is planned and divided into smaller tasks
  @HiveField(14)
  final Duration? totalSpentTime;

  /// Store all time spent based on miliseconds in TaskDoingTimFrameModels
  @HiveField(15)
  final String? superMainTaskId;

  /// Doing work with the presence and help of other people
  @HiveField(16)
  final List<String>? contributorsId;

  /// Status == 0 => notStarted\
  /// Status == 1 => inProgress\
  /// Status == 2 => completed
  @HiveField(17)
  final Status status;

  MainTaskEntity(
      {super.id,
      super.creatorId,
      super.description,
      required this.title,
      required this.taskCategoriesId,
      required super.createdAt,
      required this.colorCode,
      required this.iconCode,
      this.priority = Priority.optional,
      this.status = Status.notStarted,
      this.fixedTagsId,
      this.tagsId,
      this.contributorsId,
      this.superMainTaskId,
      this.dueTime,
      this.repetitionInterval,
      this.totalSpentTime,
      this.selectedWeekDays});

  /// Creates a copy of this CategoryEntity with potentially modified properties.
  MainTaskEntity copyWith(
          String? id,
          DateTime? createdAt,
          String? creatorId,
          String? description,
          String? title,
          int? colorCode,
          int? iconCode,
          List<String>? taskCategoriesId,
          Priority? priority,
          Status? status,
          List<String>? fixedTagsId,
          List<String>? tagsId,
          List<String>? contributorsId,
          String? superMainTaskId,
          DateTime? dueTime,
          RepetitionInterval? repetitionInterval,
          Duration? totalSpentTime,
          List<WeekDays>? selectedWeekDays) =>
      MainTaskEntity(
        id: id ?? this.id,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        creatorId: creatorId ?? this.creatorId,
        title: title ?? this.title,
        colorCode: colorCode ?? this.colorCode,
        iconCode: iconCode ?? this.iconCode,
        taskCategoriesId: taskCategoriesId ?? this.taskCategoriesId,
        priority: priority ?? this.priority,
        status: status ?? this.status,
        fixedTagsId: fixedTagsId ?? this.fixedTagsId,
        tagsId: tagsId ?? this.tagsId,
        contributorsId: contributorsId ?? this.contributorsId,
        superMainTaskId: superMainTaskId ?? this.superMainTaskId,
        dueTime: dueTime ?? this.dueTime,
        repetitionInterval: repetitionInterval ?? this.repetitionInterval,
        totalSpentTime: totalSpentTime ?? this.totalSpentTime,
        selectedWeekDays: selectedWeekDays ?? this.selectedWeekDays,
      );

  @override
  List<Object?> get props => [
        id,
        creatorId,
        description,
        title,
        taskCategoriesId,
        createdAt,
        colorCode,
        iconCode,
        priority,
        status,
        fixedTagsId,
        tagsId,
        contributorsId,
        superMainTaskId,
        dueTime,
        repetitionInterval,
        totalSpentTime,
      ];

  @override
  BaseEntityAbstraction fromEntity(BaseEntityAbstraction entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  MainTaskEntity toEntity() {
    // TODO: implement toEntity
    throw UnimplementedError();
  }
}
