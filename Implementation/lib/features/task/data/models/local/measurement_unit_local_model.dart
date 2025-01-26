import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/measurement_unit_entity.dart';

part 'measurement_unit_local_model.g.dart';

@HiveType(typeId: 4) // Unique ID for Hive
class MeasurementUnitLocalModel extends MeasurementUnitEntity {
  MeasurementUnitLocalModel({
    required super.title,
    required super.iconCode,
    super.id,
    super.updatedAt,
    super.description,
    super.createdAt,
    super.userId,
    super.isDouble = false,
  });

  // For the purpose of testing
  MeasurementUnitLocalModel.empty() : super.empty();

  factory MeasurementUnitLocalModel.fromEntity(MeasurementUnitEntity entity) =>
      MeasurementUnitLocalModel(
        id: entity.id,
        updatedAt: entity.updatedAt,
        description: entity.description,
        createdAt: entity.createdAt,
        userId: entity.userId,
        title: entity.title,
        iconCode: entity.iconCode,
        isDouble: entity.isDouble,
      );

  @override
  MeasurementUnitLocalModel copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? title,
    String? description,
    int? iconCode,
    bool? isDouble,
  }) =>
      MeasurementUnitLocalModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        description: description ?? this.description,
        iconCode: iconCode ?? this.iconCode,
        isDouble: isDouble ?? this.isDouble,
      );
}
