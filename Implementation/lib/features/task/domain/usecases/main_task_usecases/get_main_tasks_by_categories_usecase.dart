import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class GetMainTasksByCategoriesUsecase extends UseCaseWithParams<
    MainTaskRepository, List<MainTaskEntity>, List<String>> {
  GetMainTasksByCategoriesUsecase(super.repository);

  /// [params] = List of category ids
  @override
  ResultFuture<List<MainTaskEntity>> call(List<String> params) async =>
      repository.getMainTasksByCategories(params);
}
