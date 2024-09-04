import 'package:flutter/material.dart';
import 'package:zamaan/models/tag_model.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';

/// It depends on the type of use of each person\
/// and each person can have his/her own\
/// use of tags, but the following example\
/// explains the best way.\
/// \
/// For example : programming as a task\
/// is placed in the job group\
/// and tags can be used to specify the\
/// type of language (C#, Pyton, PHP ,...) or work eara
class TagDTO extends DTOAbstraction<TagModel> {
  final String title;

  final Color color;

  final IconData icon;

  TagDTO({
    required super.id,
    required this.title,
    super.creatorId,
    super.description,
    required this.color,
    required this.icon,
  });

  factory TagDTO.fromModel({required TagModel tagModel}) => TagDTO(
      id: tagModel.id,
      creatorId: tagModel.creatorId,
      title: tagModel.title,
      description: tagModel.description,
      color: Color(tagModel.colorCode),
      icon: IconData(tagModel.iconCode));

  @override
  TagModel toModel() => TagModel(
        id: id,
        title: title,
        colorCode: color.value,
        iconCode: icon.codePoint,
        creatorId: creatorId,
        description: description,
      );
}
