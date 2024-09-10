import 'package:zamaan/core/entities/base_entity_abstraction.dart';

/// Categories such as : sport, reading, working, fun ,...
class CategoryDTO extends BaseEntityAbstraction {
  final String? title;

  /// Store the color value as an integer
  final int colorCode;

  ///Instead of saving the entire icon, save its IconData
  final int iconCode;

  CategoryDTO({
    super.id,
    required this.title,
    super.creatorId,
    super.description,
    required this.colorCode,
    required this.iconCode,
  });
}
