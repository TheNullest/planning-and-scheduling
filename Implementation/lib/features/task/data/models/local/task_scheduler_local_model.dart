import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';

part 'task_scheduler_local_model.g.dart';

@HiveType(typeId: 5) // Unique ID for Hive
class TaskSchedulerLocalModel extends TaskSchedulerEntity {
  TaskSchedulerLocalModel({
    required super.mainTaskId,
    super.id,
    super.updatedAt,
    super.description,
    super.createdAt,
    super.userId,
    super.goalId,
    super.willStartAt,
    super.endAt,
    super.repetitionType,
    super.timeUnit,
    super.specificTimes,
  }) : super();

  // For the purpose of testing
  TaskSchedulerLocalModel.empty() : super.empty();

  factory TaskSchedulerLocalModel.fromEntity(TaskSchedulerEntity entity) =>
      TaskSchedulerLocalModel(
        id: entity.id,
        updatedAt: entity.updatedAt,
        description: entity.description,
        createdAt: entity.createdAt,
        userId: entity.userId,
        mainTaskId: entity.mainTaskId,
        willStartAt: entity.willStartAt,
        goalId: entity.goalId,
        endAt: entity.endAt,
        repetitionType: entity.repetitionType,
        timeUnit: entity.timeUnit,
        specificTimes: entity.specificTimes,
      );

  /// Creates a copy of the current `TaskSchedulerEntity` with updated values.
  @override
  TaskSchedulerLocalModel copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? description,
    String? mainTaskId,
    String? goalId,
    DateTime? willStartAt,
    DateTime? endAt,
    int? repetitionType,
    int? timeUnit,
    List<int>? specificTimes,
  }) =>
      TaskSchedulerLocalModel(
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
        mainTaskId: mainTaskId ?? this.mainTaskId,
        goalId: goalId ?? this.goalId,
        willStartAt: willStartAt ?? this.willStartAt,
        endAt: endAt ?? this.endAt,
        repetitionType: repetitionType ?? this.repetitionType,
        timeUnit: timeUnit ?? this.timeUnit,
        specificTimes: specificTimes ?? this.specificTimes,
      );
}
