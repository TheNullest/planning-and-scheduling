import 'package:data_layer/models/tag_model.dart';
import 'package:domain_layer/dtos/dto_abstract.dart';

/// It depends on the type of use of each person\
/// and each person can have his/her own\
/// use of tags, but the following example\
/// explains the best way.\
/// \
/// For example : programming as a task\
/// is placed in the job group\
/// and tags can be used to specify the\
/// type of language (C#, Pyton, PHP ,...) or work eara
class TagDTO extends BaseDTOAbstraction<TagModel> {
  final String title;

  final int colorCode;

  final int iconCode;

  TagDTO({
    required super.id,
    required this.title,
    super.creatorId,
    super.description,
    required this.colorCode,
    required this.iconCode,
  });

  factory TagDTO.fromModel({required TagModel model}) => TagDTO(
      id: model.id,
      creatorId: model.creatorId,
      title: model.title,
      description: model.description,
      colorCode: model.colorCode,
      iconCode: model.iconCode);

  @override
  TagModel toModel() => TagModel(
        id: id,
        title: title,
        colorCode: colorCode,
        iconCode: iconCode,
        creatorId: creatorId,
        description: description,
      );
}
