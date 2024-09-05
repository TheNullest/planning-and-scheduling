import 'package:data_layer/models/category_model.dart';
import 'package:domain_layer/dtos/category_dto.dart';
import 'package:data_layer/repositories/hive_category_repo.dart';
import 'package:domain_layer/use_cases/use_case_abstraction.dart';

class CategoryUseCase
    extends UseCaseAbstraction<CategoryModel, HiveCategoryRepo, CategoryDTO> {
  @override
  CategoryDTO fromModel(CategoryModel model) =>
      CategoryDTO.fromModel(model: model);
}
