import 'package:hive/hive.dart';
import 'package:zamaan/models/bases/base_type_adapter_asbtract.dart';
import 'package:zamaan/models/models.dart';

part 'task_category_model.g.dart';

/// Categories such as : sport, reading, working, fun ,...
@HiveType(typeId: 2)
class TaskCategoryModel extends BaseModelAbstraction {
  /// Default and predefined groups don't have creatorId

  @HiveField(3)
  final String? title;

  /// Store the color value as an integer
  @HiveField(4)
  final int colorCode;

  ///Instead of saving the entire icon, save its IconData
  @HiveField(5)
  final int iconCode;

  TaskCategoryModel({
    required super.id,
    super.creatorId,
    required this.title,
    super.description,
    required this.colorCode,
    required this.iconCode,
  });
}
