import 'package:hive/hive.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';

part 'hive_goal_model.g.dart';

@HiveType(typeId: 3) // Unique ID for Hive
class HiveGoalModel extends GoalEntity {
  HiveGoalModel({
    super.id,
    super.order,
    super.description,
    super.createdAt,
    super.creatorId,
    required super.mainTaskId,
    required super.measurementUnitId,
    required super.measurementValue,
    super.subTaskId,
    super.perActiveHour,
    super.perActiveDay,
    super.perActiveWeek,
    super.perActiveMonth,
    super.perActiveYear,
  });

  // For the purpose of testing
  HiveGoalModel.empty() : super.empty();

  factory HiveGoalModel.fromEntity(GoalEntity entity) => HiveGoalModel(
        id: entity.id,
        order: entity.order,
        description: entity.description,
        createdAt: entity.createdAt,
        creatorId: entity.creatorId,
        mainTaskId: entity.mainTaskId,
        measurementUnitId: entity.measurementUnitId,
        measurementValue: entity.measurementValue,
        subTaskId: entity.subTaskId,
        perActiveHour: entity.perActiveHour,
        perActiveDay: entity.perActiveDay,
        perActiveWeek: entity.perActiveWeek,
        perActiveMonth: entity.perActiveMonth,
        perActiveYear: entity.perActiveYear,
      );

  GoalEntity toEntity() => GoalEntity(
        id: id,
        order: order,
        description: description,
        createdAt: createdAt,
        creatorId: creatorId,
        mainTaskId: mainTaskId,
        measurementUnitId: measurementUnitId,
        measurementValue: measurementValue,
        subTaskId: subTaskId,
        perActiveHour: perActiveHour,
        perActiveDay: perActiveDay,
        perActiveWeek: perActiveWeek,
        perActiveMonth: perActiveMonth,
        perActiveYear: perActiveYear,
      );
}
