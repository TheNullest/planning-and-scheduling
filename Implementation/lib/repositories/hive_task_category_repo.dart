import 'package:hive/hive.dart';
import 'package:zamaan/models/task_category_model.dart';
import 'package:zamaan/repositories/hive_base_repository_abstraction.dart';

class HiveCategoryRepo
    extends HiveBaseRepositoryAbstraction<TaskCategoryModel> {
  static const String _boxName = 'groupsBox';

  @override
  String get boxName => _boxName;

  @override
  TypeAdapter<TaskCategoryModel> get modelAdapter => TaskCategoryModelAdapter();
}
