import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/category_entity.dart';

part 'hive_category_model.g.dart';

@HiveType(typeId: 2) // Unique ID for Hive
class HiveCategoryModel extends CategoryEntity {
  HiveCategoryModel({
    super.id,
    super.order,
    super.description,
    super.createdAt,
    super.creatorId,
    required super.title,
    required super.colorCode,
    required super.iconCode,
  });

  // For the purpose of testing
  HiveCategoryModel.empty() : super.empty();

  factory HiveCategoryModel.fromEntity(CategoryEntity entity) =>
      HiveCategoryModel(
        id: entity.id,
        order: entity.order,
        description: entity.description,
        createdAt: entity.createdAt,
        creatorId: entity.creatorId,
        title: entity.title,
        colorCode: entity.colorCode,
        iconCode: entity.iconCode,
      );

  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        order: order,
        description: description,
        createdAt: createdAt,
        creatorId: creatorId,
        title: title,
        colorCode: colorCode,
        iconCode: iconCode,
      );
}
