import 'package:flutter/material.dart';
import 'package:zamaan/models/models.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';

/// Categories such as : sport, reading, working, fun ,...
class TaskCategoryDTO extends DTOAbstract {
  final String? title;

  final String? description;

  /// Store the color value as an integer
  final Color color;

  ///Instead of saving the entire icon, save its IconData
  final IconData icon;

  TaskCategoryDTO({
    required super.id,
    required this.title,
    required this.description,
    required this.color,
    required this.icon,
  });
  factory TaskCategoryDTO.fromModel({
    required TaskCategoryModel taskCategoryModel,
  }) =>
      TaskCategoryDTO(
          color: Color(taskCategoryModel.colorCode),
          description: taskCategoryModel.description,
          icon: IconData(taskCategoryModel.iconCode),
          title: taskCategoryModel.title,
          id: taskCategoryModel.id);
}
