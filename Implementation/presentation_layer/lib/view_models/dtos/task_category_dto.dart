import 'package:flutter/material.dart';
import 'package:zamaan/models/models.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';

/// Categories such as : sport, reading, working, fun ,...
class TaskCategoryDTO extends DTOAbstraction<TaskCategoryModel> {
  final String? title;

  /// Store the color value as an integer
  final Color color;

  ///Instead of saving the entire icon, save its IconData
  final IconData icon;

  TaskCategoryDTO({
    required super.id,
    required this.title,
    super.creatorId,
    super.description,
    required this.color,
    required this.icon,
  });
  factory TaskCategoryDTO.fromModel({
    required TaskCategoryModel taskCategoryModel,
  }) =>
      TaskCategoryDTO(
          creatorId: taskCategoryModel.creatorId,
          color: Color(taskCategoryModel.colorCode),
          description: taskCategoryModel.description,
          icon: IconData(taskCategoryModel.iconCode),
          title: taskCategoryModel.title,
          id: taskCategoryModel.id);

  @override
  TaskCategoryModel toModel() => TaskCategoryModel(
      id: id,
      creatorId: creatorId,
      description: description,
      title: title,
      colorCode: color.value,
      iconCode: icon.codePoint);
}
