import 'package:hive/hive.dart';
import 'package:zamaan/models/bases/base_type_adapter_asbtract.dart';
import 'package:zamaan/models/models.dart';

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
class TagModel extends BaseModelAbstract {
  /// Default and predefined tags don't have creatorId
  @HiveField(1)
  final String? creatorId;

  @HiveField(2)
  final String tagName;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final int colorCode;

  @HiveField(5)
  final int iconCode;

  TagModel(
      {required super.id,
      required this.creatorId,
      required this.tagName,
      required this.description,
      required this.colorCode,
      required this.iconCode});
}
