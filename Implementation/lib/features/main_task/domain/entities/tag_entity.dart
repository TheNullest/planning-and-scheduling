import 'package:zamaan/core/entities/base_entity_abstraction.dart';

/// It depends on the type of use of each person\
/// and each person can have his/her own\
/// use of tags, but the following example\
/// explains the best way.\
/// \
/// For example : programming as a task\
/// is placed in the job group\
/// and tags can be used to specify the\
/// type of language (C#, Pyton, PHP ,...) or work eara
class TagEntity extends BaseEntityAbstraction {
  final String title;

  final int colorCode;

  final int iconCode;

  TagEntity({
    super.id,
    required this.title,
    super.creatorId,
    super.description,
    required this.colorCode,
    required this.iconCode,
  });
}
