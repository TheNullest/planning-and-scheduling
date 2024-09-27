import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/tag_entity.dart';

part 'hive_tag_model.g.dart'; // Include for code generation

/// The `tags` attribute can be used to categorize or label a task in various ways,
/// depending on the specific needs and preferences of the user. Here's an example:
///
/// For example, a task like "Learn Python" could be placed in the "Programming" category.
/// To further specify the task, tags could be used to indicate the specific Python
/// version (e.g., "Python 3.11") or the intended use case (e.g., "Web development").
///
/// The choice of tags is entirely up to the user and can vary based on their individual
/// workflow and organizational preferences.
@HiveType(typeId: 7) // Unique ID for Hive
class HiveTagModel extends TagEntity {
  HiveTagModel({
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
  HiveTagModel.empty() : super.empty();

  factory HiveTagModel.fromEntity(TagEntity entity) => HiveTagModel(
        id: entity.id,
        order: entity.order,
        description: entity.description,
        createdAt: entity.createdAt,
        creatorId: entity.creatorId,
        title: entity.title,
        colorCode: entity.colorCode,
        iconCode: entity.iconCode,
      );

  TagEntity toEntity() => TagEntity(
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
