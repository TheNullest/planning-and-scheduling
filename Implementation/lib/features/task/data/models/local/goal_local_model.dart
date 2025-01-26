import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';

part 'goal_local_model.g.dart';

@HiveType(typeId: 3) // Unique ID for Hive
class GoalLocalModel extends GoalEntity {
  GoalLocalModel({
    required super.mainTaskId,
    required super.measurementUnitId,
    required super.measurementValue,
    super.id,
    super.updatedAt,
    super.description,
    super.createdAt,
    super.userId,
    super.subTaskId,
    super.perActiveHour,
    super.perActiveDay,
    super.perActiveWeek,
    super.perActiveMonth,
    super.perActiveYear,
  });

  // For the purpose of testing
  GoalLocalModel.empty() : super.empty();

  factory GoalLocalModel.fromEntity(GoalEntity entity) => GoalLocalModel(
        id: entity.id,
        updatedAt: entity.updatedAt,
        description: entity.description,
        createdAt: entity.createdAt,
        userId: entity.userId,
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

  @override
  GoalLocalModel copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? description,
    String? mainTaskId,
    String? measurementUnitId,
    int? measurementValue,
    String? subTaskId,
    double? perActiveHour,
    double? perActiveDay,
    double? perActiveWeek,
    double? perActiveMonth,
    double? perActiveYear,
  }) =>
      GoalLocalModel(
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
        mainTaskId: mainTaskId ?? this.mainTaskId,
        subTaskId: subTaskId ?? this.subTaskId,
        measurementUnitId: measurementUnitId ?? this.measurementUnitId,
        measurementValue: measurementValue ?? this.measurementValue,
        perActiveHour: perActiveHour ?? this.perActiveHour,
        perActiveDay: perActiveDay ?? this.perActiveDay,
        perActiveWeek: perActiveWeek ?? this.perActiveWeek,
        perActiveMonth: perActiveMonth ?? this.perActiveMonth,
        perActiveYear: perActiveYear ?? this.perActiveYear,
      );
}
