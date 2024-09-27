import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/utils/enums/enums.dart';

/// Represents a task scheduler entity with various repetition patterns.
/// This class is used to define the scheduling details of a task, including
/// its start time, end time, and repetition patterns.
class TaskSchedulerEntity extends BaseEntityAbstraction {
  /// The ID of the main task associated with this schedule.
  @HiveField(4)
  final String mainTaskId;

  @HiveField(5)
  final String? goalId;

  /// The start time of the task.\
  /// This field indicates when the task is scheduled to start.\
  /// If the task has a specific start time, it should be set here.
  @HiveField(6)
  final DateTime? willStartAt;

  /// Retrieves scheduled times by their repetition type.
  ///
  /// [repetitionType] - The type of repetition, based on the `RepetitionType` enum.
  /// - `index`.`type`.`value` : `description`
  /// - `0.RepetitionType.every`: Repeats every specified time unit.
  /// - `1.RepetitionType.per`: Repeats per a specified interval and time unit.
  /// - `2.RepetitionType.interval`: Repeats at regular intervals of the specified time unit.
  /// - `3.RepetitionType.specificDateTimes`: Repeats on specific dateTimes.
  @HiveField(7)
  final int repetitionType;

  /// The unit of time for the repetition (default: TimeUnit.day).
  ///
  /// - `index`.`type`.`value` : `description`
  /// - `0.TimeUnit.minute`: Represents an minute.
  /// - `1.TimeUnit.hour`: Represents an hour.
  /// - `2.TimeUnit.day`: Represents a day.
  /// - `3.TimeUnit.week`: Represents a week.
  /// - `4.TimeUnit.month`: Represents a month.
  /// - `5.TimeUnit.year`: Represents a year.
  @HiveField(8)
  final int timeUnit;

  /// The specific times for the repetition (optional).
  ///
  /// - For `RepetitionType.every`: Specifies times like [10, 12, 16] o'clock every 2 days.
  /// - For `RepetitionType.specificDays`: Specifies days like [2, 3, 5] of each week or [10, 20, 25] of each month.
  @HiveField(9)
  final List<int>? specificTimes;

  /// **Conditional End Time:**
  ///
  /// - If the task has a **predefined end time**, then `endAt` should be set
  ///   at the same time as the entire `TaskSchedulerEntity` definition.
  ///   This signifies a fixed duration for the task.
  /// - If the task has no predefined end time, `endAt` will be set later
  ///   when the task is actually completed. This indicates a dynamic duration.
  @HiveField(10)
  final DateTime? endAt;

  /// Constructor for creating a `TaskSchedulerEntity`.
  ///
  /// - [mainTaskId] is the ID of the main task.
  /// - [goalId] is the ID of the goal.
  /// - [willStartAt] is the start time of the task.
  /// - [repetitionType] is the type of repetition (default: RepetitionType.every).
  /// - [timeUnit] is the unit of time for the repetition (default: TimeUnit.day).
  /// - [specificTimes] are the specific times for the repetition (optional).
  /// - [endAt] is the end time of the task (**Conditional**).
  TaskSchedulerEntity({
    super.id,
    super.order,
    super.createdAt,
    super.creatorId,
    super.description,
    required this.mainTaskId,
    this.goalId,
    this.willStartAt,
    this.endAt,
    int? repetitionType,
    int? timeUnit,
    this.specificTimes,
  })  : repetitionType = repetitionType ?? RepetitionType.every.index,
        timeUnit = timeUnit ?? TimeUnit.day.index;

  /// Creates an empty `TaskSchedulerEntity` with default values.
  TaskSchedulerEntity.empty()
      : this(
            mainTaskId: '1',
            willStartAt: DateTime(2024, 08),
            endAt: DateTime(2024, 10));

  /// Creates a copy of the current `TaskSchedulerEntity` with updated values.
  TaskSchedulerEntity copyWith(
          String? id,
          int? order,
          DateTime? createdAt,
          String? creatorId,
          String? description,
          String? mainTaskId,
          String? goalId,
          DateTime? willStartAt,
          DateTime? endAt,
          int? repetitionType,
          int? timeUnit,
          List<int>? specificTimes) =>
      TaskSchedulerEntity(
        id: id ?? this.id,
        order: order ?? this.order,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        creatorId: creatorId ?? this.creatorId,
        mainTaskId: mainTaskId ?? this.mainTaskId,
        goalId: goalId ?? this.goalId,
        willStartAt: willStartAt ?? this.willStartAt,
        endAt: endAt ?? this.endAt,
        repetitionType: repetitionType ?? this.repetitionType,
        timeUnit: timeUnit ?? this.timeUnit,
        specificTimes: specificTimes ?? this.specificTimes,
      );

  /// Returns a list of properties for equality comparison.
  @override
  List<Object?> get props => [
        id,
        order,
        createdAt,
        creatorId,
        description,
        mainTaskId,
        goalId,
        willStartAt,
        endAt,
        repetitionType,
        timeUnit,
        specificTimes,
      ];
}
