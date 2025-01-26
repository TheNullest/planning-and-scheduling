import 'package:zamaan/core/data_sources/base_data_source_abstraction.dart';
import 'package:zamaan/features/task/domain/entities/category_entity.dart';

abstract class CategoryDataSource<CategoryModel extends CategoryEntity>
    extends BaseDataSourceAbstraction<CategoryModel> {}
