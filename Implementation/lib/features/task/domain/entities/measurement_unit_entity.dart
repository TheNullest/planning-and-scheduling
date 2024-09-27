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
