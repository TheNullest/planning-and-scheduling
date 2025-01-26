import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/tag_entity.dart';

part 'tag_local_model.g.dart'; // Include for code generation

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
class TagLocalModel extends TagEntity {
  TagLocalModel({
    required super.title,
    required super.colorCode,
    required super.iconCode,
    super.id,
    super.updatedAt,
    super.description,
    super.createdAt,
    super.userId,
  });

  // For the purpose of testing
  TagLocalModel.empty() : super.empty();

  factory TagLocalModel.fromEntity(TagEntity entity) => TagLocalModel(
        id: entity.id,
        updatedAt: entity.updatedAt,
        description: entity.description,
        createdAt: entity.createdAt,
        userId: entity.userId,
        title: entity.title,
        colorCode: entity.colorCode,
        iconCode: entity.iconCode,
      );

  @override
  TagLocalModel copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? description,
    String? title,
    int? colorCode,
    int? iconCode,
  }) =>
      TagLocalModel(
        id: id ?? this.id,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        colorCode: colorCode ?? this.colorCode,
        iconCode: iconCode ?? this.iconCode,
      );
}
