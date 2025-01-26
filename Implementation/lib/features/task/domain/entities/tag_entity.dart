import 'package:zamaan/features/task/domain/entities/category_entity.dart';

/// The `tags` attribute can be used to categorize or label a task in various ways,\
/// depending on the specific needs and preferences of the user. Here's an example:
///
/// For example, a task like "Learn Python" could be placed in the "Programming" category.\
/// To further specify the task, tags could be used to indicate the specific Python\
/// version (e.g., "Python 3.11") or the intended use case (e.g., "Web development").
///
/// The choice of tags is entirely up to the user and can vary based on their individual\
/// workflow and organizational preferences.
class TagEntity extends CategoryEntity {
  TagEntity({
    required super.title,
    required super.colorCode,
    required super.iconCode,
    super.id,
    super.updatedAt,
    super.createdAt,
    super.userId,
    super.description,
  });

  TagEntity.empty() : super.empty();

  @override
  TagEntity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? description,
    String? title,
    int? colorCode,
    int? iconCode,
  }) =>
      TagEntity(
        id: id ?? this.id,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        colorCode: colorCode ?? this.colorCode,
        iconCode: iconCode ?? this.iconCode,
      );

  @override
  TagEntity toEntity() => TagEntity(
        id: id,
        updatedAt: updatedAt,
        description: description,
        createdAt: createdAt,
        userId: userId,
        title: title,
        colorCode: colorCode,
        iconCode: iconCode,
      );
}
