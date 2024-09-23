import 'package:zamaan/core/usecases/delete_entity_usecase.dart';
import 'package:zamaan/features/task/domain/repositories/category_repository.dart';

class DeleteCategoryUsecase extends DeleteEntityUseCase<CategoryRepository> {
  DeleteCategoryUsecase(super.repository);
}
