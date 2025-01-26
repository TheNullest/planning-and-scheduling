import 'package:hive/hive.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';

class MeasurementUnitEntity extends BaseEntityAbstraction {
  MeasurementUnitEntity({
    required this.title,
    required this.iconCode,
    super.id,
    super.createdAt,
    super.updatedAt,
    super.userId,
    super.description,
    this.isDouble = false,
  });

  MeasurementUnitEntity.empty() : this(title: 'title', iconCode: 2);
  @HiveField(4)
  final String title;

  @HiveField(5)
  final bool isDouble;

  @HiveField(6)
  final int iconCode;

  MeasurementUnitEntity toEntity() => MeasurementUnitEntity(
        id: id,
        updatedAt: updatedAt,
        description: description,
        createdAt: createdAt,
        userId: userId,
        title: title,
        iconCode: iconCode,
        isDouble: isDouble,
      );

  @override
  MeasurementUnitEntity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? title,
    String? description,
    int? iconCode,
    bool? isDouble,
  }) =>
      MeasurementUnitEntity(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        description: description ?? this.description,
        iconCode: iconCode ?? this.iconCode,
        isDouble: isDouble ?? this.isDouble,
      );

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        userId,
        description,
        title,
        isDouble,
        iconCode,
      ];
}
