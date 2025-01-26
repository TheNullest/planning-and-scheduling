import 'package:zamaan/core/usecases/update_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/category_entity.dart';
import 'package:zamaan/features/task/domain/repositories/category_repository.dart';

class UpdateCategoryUsecase
    extends UpdateEntityUseCase<CategoryEntity, CategoryRepository> {
  UpdateCategoryUsecase(super.repository);
}
