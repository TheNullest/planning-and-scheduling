import 'package:hive/hive.dart';
import 'bases/base_type_adapter_asbtraction.dart';
import 'models.dart';

part 'tag_model.g.dart';

/// It depends on the type of use of each person\
/// and each person can have his/her own\
/// use of tags, but the following example\
/// explains the best way.\
/// \
/// For example : programming as a task\
/// is placed in the job group\
/// and tags can be used to specify the\
/// type of language (C#, Pyton, PHP ,...) or work eara
@HiveType(typeId: 7)
class TagModel extends BaseModelAbstraction {
  /// Default and predefined tags don't have creatorId

  @HiveField(3)
  final String title;

  @HiveField(4)
  final int colorCode;

  @HiveField(5)
  final int iconCode;

  TagModel(
      {required super.id,
      super.creatorId,
      super.description,
      required this.title,
      required this.colorCode,
      required this.iconCode});
}
