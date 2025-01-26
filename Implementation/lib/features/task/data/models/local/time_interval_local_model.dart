import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';

part 'time_interval_local_model.g.dart'; // Include for code generation

@HiveType(typeId: 8) // Unique ID for Hive
class TimeIntervalLocalModel extends TimeIntervalEntity {
  TimeIntervalLocalModel({
    required super.mainTaskId,
    required super.subTaskId,
    required super.startAt,
    super.id,
    super.updatedAt,
    super.description,
    super.createdAt,
    super.userId,
    super.endAt,
    super.spentTime,
  }) : super();
  factory TimeIntervalLocalModel.fromEntity(TimeIntervalEntity entity) =>
      TimeIntervalLocalModel(
        id: entity.id,
        updatedAt: entity.updatedAt,
        description: entity.description,
        createdAt: entity.createdAt,
        userId: entity.userId,
        mainTaskId: entity.mainTaskId,
        subTaskId: entity.subTaskId,
        startAt: entity.startAt,
        endAt: entity.endAt,
        spentTime: entity.spentTime,
      );

  // For the purpose of testing
  TimeIntervalLocalModel.empty() : super.empty();

  @override
  TimeIntervalLocalModel copyWith({
    String? id,
    int? order,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? description,
    String? mainTaskId,
    String? subTaskId,
    DateTime? startAt,
    DateTime? endAt,
  }) =>
      TimeIntervalLocalModel(
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
        mainTaskId: mainTaskId ?? this.mainTaskId,
        subTaskId: subTaskId ?? this.subTaskId,
        startAt: startAt ?? this.startAt,
        endAt: endAt ?? this.endAt,
      );
}
