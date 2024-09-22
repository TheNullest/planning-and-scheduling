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
  TagEntity(
      {super.id,
      super.order,
      super.createdAt,
      super.creatorId,
      super.description,
      required super.title,
      required super.colorCode,
      required super.iconCode});
}
