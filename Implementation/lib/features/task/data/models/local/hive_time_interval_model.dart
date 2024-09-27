import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';

part 'hive_time_interval_model.g.dart'; // Include for code generation

@HiveType(typeId: 8) // Unique ID for Hive
class HiveTimeIntervalModel extends TimeIntervalEntity {
  HiveTimeIntervalModel(
      {super.id,
      super.order,
      super.description,
      super.createdAt,
      super.creatorId,
      required super.mainTaskId,
      required super.subTaskId,
      required super.startAt,
      super.endAt,
      super.spentTime})
      : super();

  // For the purpose of testing
  HiveTimeIntervalModel.empty() : super.empty();

  factory HiveTimeIntervalModel.fromEntity(TimeIntervalEntity entity) =>
      HiveTimeIntervalModel(
        id: entity.id,
        order: entity.order,
        description: entity.description,
        createdAt: entity.createdAt,
        creatorId: entity.creatorId,
        mainTaskId: entity.mainTaskId,
        subTaskId: entity.subTaskId,
        startAt: entity.startAt,
        endAt: entity.endAt,
        spentTime: entity.spentTime,
      );

  TimeIntervalEntity toEntity() => TimeIntervalEntity(
        id: id,
        order: order,
        description: description,
        createdAt: createdAt,
        creatorId: creatorId,
        mainTaskId: mainTaskId,
        subTaskId: subTaskId,
        startAt: startAt,
        endAt: endAt,
        spentTime: spentTime,
      );
}
