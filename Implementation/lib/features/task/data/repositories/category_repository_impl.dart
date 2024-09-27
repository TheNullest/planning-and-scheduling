import 'package:zamaan/core/repositories/base_crud_operations.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_category_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_category_model.dart';
import 'package:zamaan/features/task/domain/entities/category_entity.dart';
import 'package:zamaan/features/task/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl extends BaseCRUDOperations<
    CategoryEntity,
    HiveCategoryModel,
    HiveCategoryDataSourceImpl> implements CategoryRepository {
  CategoryRepositoryImpl(super.dataSource);

  @override
  HiveCategoryModel fromEntity(CategoryEntity entity) =>
      HiveCategoryModel.fromEntity(entity);

  @override
  CategoryEntity toEntity(HiveCategoryModel model) => model.toEntity();
}
