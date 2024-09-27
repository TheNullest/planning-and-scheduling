import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';

part 'hive_task_scheduler_model.g.dart';

@HiveType(typeId: 5) // Unique ID for Hive
class HiveTaskSchedulerModel extends TaskSchedulerEntity {
  HiveTaskSchedulerModel({
    super.id,
    super.order,
    super.description,
    super.createdAt,
    super.creatorId,
    required super.mainTaskId,
    super.goalId,
    super.willStartAt,
    super.endAt,
    super.repetitionType,
    super.timeUnit,
    super.specificTimes,
  }) : super();

  // For the purpose of testing
  HiveTaskSchedulerModel.empty() : super.empty();

  factory HiveTaskSchedulerModel.fromEntity(TaskSchedulerEntity entity) =>
      HiveTaskSchedulerModel(
        id: entity.id,
        order: entity.order,
        description: entity.description,
        createdAt: entity.createdAt,
        creatorId: entity.creatorId,
        mainTaskId: entity.mainTaskId,
        willStartAt: entity.willStartAt,
        goalId: entity.goalId,
        endAt: entity.endAt,
        repetitionType: entity.repetitionType,
        timeUnit: entity.timeUnit,
        specificTimes: entity.specificTimes,
      );

  TaskSchedulerEntity toEntity() => TaskSchedulerEntity(
        id: id,
        order: order,
        description: description,
        createdAt: createdAt,
        creatorId: creatorId,
        mainTaskId: mainTaskId,
        goalId: goalId,
        willStartAt: willStartAt,
        endAt: endAt,
        repetitionType: repetitionType,
        timeUnit: timeUnit,
        specificTimes: specificTimes,
      );
}
