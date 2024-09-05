import 'package:data_layer/models/category_model.dart';
import 'package:domain_layer/dtos/dto_abstract.dart';

/// Categories such as : sport, reading, working, fun ,...
class CategoryDTO extends BaseDTOAbstraction<CategoryModel> {
  final String? title;

  /// Store the color value as an integer
  final int colorCode;

  ///Instead of saving the entire icon, save its IconData
  final int iconCode;

  CategoryDTO({
    required super.id,
    required this.title,
    super.creatorId,
    super.description,
    required this.colorCode,
    required this.iconCode,
  });

  factory CategoryDTO.fromModel({required CategoryModel model}) => CategoryDTO(
      creatorId: model.creatorId,
      colorCode: model.colorCode,
      description: model.description,
      iconCode: model.iconCode,
      title: model.title,
      id: model.id);

  @override
  CategoryModel toModel() => CategoryModel(
      id: id,
      creatorId: creatorId,
      description: description,
      title: title,
      colorCode: colorCode,
      iconCode: iconCode);
}
