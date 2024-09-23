import 'package:zamaan/core/usecases/get_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/category_entity.dart';
import 'package:zamaan/features/task/domain/repositories/category_repository.dart';

class GetCategoryUsecase
    extends GetEntityUseCase<CategoryRepository, CategoryEntity> {
  GetCategoryUsecase(super.repository);
}
