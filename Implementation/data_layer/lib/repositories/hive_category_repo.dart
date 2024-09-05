import 'package:hive/hive.dart';
import '../models/category_model.dart';
import 'hive_base_repository_abstraction.dart';

class HiveCategoryRepo extends HiveBaseRepositoryAbstraction<CategoryModel> {
  static const String _boxName = 'categoriesBox';

  @override
  String get boxName => _boxName;

  @override
  TypeAdapter<CategoryModel> get modelAdapter => CategoryModelAdapter();
}
