import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class GetMainTaskByCategoriesUsecase extends UseCaseWithParams<
    MainTaskRepository, List<MainTaskEntity>, List<String>> {
  GetMainTaskByCategoriesUsecase(super.repository);

  /// [params] = List of category ids
  @override
  ResultFuture<List<MainTaskEntity>> call(List<String> params) async =>
      await repository.getMainTasksByCategories(params);
}
