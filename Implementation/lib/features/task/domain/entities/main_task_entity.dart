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
  final List<String>? taskCategoriyIds;

  @HiveField(12)
  final List<String>? fixedTagIds;

  @HiveField(13)
  final List<String>? tagIds;

  /// When a project is planned and divided into smaller tasks
  @HiveField(14)
  final Duration? totalSpentTime;

  /// Store all time spent based on miliseconds in TaskDoingTimFrameModels
  @HiveField(15)
  final String? superMainTaskId;

  /// Doing work with the presence and help of other people
  @HiveField(16)
  final List<String>? contributorIds;

  /// Status == 0 => notStarted\
  /// Status == 1 => inProgress\
  /// Status == 2 => completed
  @HiveField(17)
  final Status status;

  MainTaskEntity(
      {super.id,
      super.order,
      super.creatorId,
      super.description,
      required this.title,
      required this.taskCategoriyIds,
      super.createdAt,
      required this.colorCode,
      required this.iconCode,
      this.priority = Priority.optional,
      this.status = Status.notStarted,
      this.fixedTagIds,
      this.tagIds,
      this.contributorIds,
      this.superMainTaskId,
      this.dueTime,
      this.repetitionInterval,
      this.totalSpentTime,
      this.selectedWeekDays});

  MainTaskEntity.empty()
      : this(title: 'title', taskCategoriyIds: [], colorCode: 1, iconCode: 2);

  /// Creates a copy of this CategoryEntity with potentially modified properties.
  MainTaskEntity copyWith(
          String? id,
          int? order,
          DateTime? createdAt,
          String? creatorId,
          String? description,
          String? title,
          int? colorCode,
          int? iconCode,
          List<String>? taskCategoriyIds,
          Priority? priority,
          Status? status,
          List<String>? fixedTagIds,
          List<String>? tagIds,
          List<String>? contributorIds,
          String? superMainTaskId,
          DateTime? dueTime,
          RepetitionInterval? repetitionInterval,
          Duration? totalSpentTime,
          List<WeekDays>? selectedWeekDays) =>
      MainTaskEntity(
        id: id ?? this.id,
        order: order ?? this.order,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        creatorId: creatorId ?? this.creatorId,
        title: title ?? this.title,
        colorCode: colorCode ?? this.colorCode,
        iconCode: iconCode ?? this.iconCode,
        taskCategoriyIds: taskCategoriyIds ?? this.taskCategoriyIds,
        priority: priority ?? this.priority,
        status: status ?? this.status,
        fixedTagIds: fixedTagIds ?? this.fixedTagIds,
        tagIds: tagIds ?? this.tagIds,
        contributorIds: contributorIds ?? this.contributorIds,
        superMainTaskId: superMainTaskId ?? this.superMainTaskId,
        dueTime: dueTime ?? this.dueTime,
        repetitionInterval: repetitionInterval ?? this.repetitionInterval,
        totalSpentTime: totalSpentTime ?? this.totalSpentTime,
        selectedWeekDays: selectedWeekDays ?? this.selectedWeekDays,
      );

  @override
  List<Object?> get props => [
        id,
        order,
        creatorId,
        description,
        title,
        taskCategoriyIds,
        createdAt,
        colorCode,
        iconCode,
        priority,
        status,
        fixedTagIds,
        tagIds,
        contributorIds,
        superMainTaskId,
        dueTime,
        repetitionInterval,
        totalSpentTime,
      ];

  @override
  BaseEntityAbstraction fromEntity(BaseEntityAbstraction entity) {
    throw UnimplementedError();
  }

  @override
  MainTaskEntity toEntity() {
    throw UnimplementedError();
  }
}
