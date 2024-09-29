import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';

class MeasurementUnitEntity extends BaseEntityAbstraction {
  @HiveField(4)
  final String title;

  @HiveField(5)
  final bool isDouble;

  @HiveField(6)
  final int iconCode;

  MeasurementUnitEntity(
      {super.id,
      super.order,
      super.createdAt,
      super.creatorId,
      super.description,
      required this.title,
      required this.iconCode,
      this.isDouble = false});
  MeasurementUnitEntity copyWith(
          {String? id,
          int? order,
          DateTime? createdAt,
          String? creatorId,
          String? title,
          String? description,
          int? iconCode,
          bool? isDouble}) =>
      MeasurementUnitEntity(
        id: id ?? this.id,
        order: order ?? this.order,
        createdAt: createdAt ?? this.createdAt,
        creatorId: creatorId ?? this.creatorId,
        title: title ?? this.title,
        description: description ?? this.description,
        iconCode: iconCode ?? this.iconCode,
        isDouble: isDouble ?? this.isDouble,
      );

  MeasurementUnitEntity.empty() : this(title: 'title', iconCode: 2);

  @override
  List<Object?> get props => [
        id,
        order,
        createdAt,
        creatorId,
        description,
        title,
        isDouble,
        iconCode,
      ];
}
