import 'package:zamaan/core/usecases/create_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/category_entity.dart';
import 'package:zamaan/features/task/domain/repositories/category_repository.dart';

class CreateCategoryUsecase
    extends CreateEntityUseCase<CategoryRepository, CategoryEntity> {
  CreateCategoryUsecase(super.repository);
}
