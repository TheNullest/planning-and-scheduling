import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class GetMainTasksByDueDateUsecase extends UseCaseWithParams<MainTaskEntity,
    MainTaskRepository, List<MainTaskEntity>, DateTime> {
  GetMainTasksByDueDateUsecase(super.repository);

  @override
  ResultFuture<List<MainTaskEntity>> call(DateTime params) async =>
      await repository.getMainTasksByDueDate(params);
}
