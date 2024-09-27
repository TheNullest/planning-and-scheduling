import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/measurement_unit_entity.dart';

part 'hive_measurement_unit_model.g.dart';

@HiveType(typeId: 4) // Unique ID for Hive
class HiveMeasurementUnitModel extends MeasurementUnitEntity {
  HiveMeasurementUnitModel({
    super.id,
    super.order,
    super.description,
    super.createdAt,
    super.creatorId,
    required super.title,
    required super.iconCode,
    super.isDouble = false,
  });

  // For the purpose of testing
  HiveMeasurementUnitModel.empty() : super.empty();

  factory HiveMeasurementUnitModel.fromEntity(MeasurementUnitEntity entity) =>
      HiveMeasurementUnitModel(
        id: entity.id,
        order: entity.order,
        description: entity.description,
        createdAt: entity.createdAt,
        creatorId: entity.creatorId,
        title: entity.title,
        iconCode: entity.iconCode,
        isDouble: entity.isDouble,
      );

  MeasurementUnitEntity toEntity() => MeasurementUnitEntity(
        id: id,
        order: order,
        description: description,
        createdAt: createdAt,
        creatorId: creatorId,
        title: title,
        iconCode: iconCode,
        isDouble: isDouble,
      );
}
