import 'package:zamaan/core/usecases/get_entities_usecase.dart';
import 'package:zamaan/features/task/domain/entities/category_entity.dart';
import 'package:zamaan/features/task/domain/repositories/category_repository.dart';

class GetCategoriesUsecase
    extends GetEntitiesUseCase<CategoryRepository, CategoryEntity> {
  GetCategoriesUsecase(super.repository);
}
