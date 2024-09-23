import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/enums.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class GetMainTaskByPriorityUsecase extends UseCaseWithParams<MainTaskRepository,
    List<MainTaskEntity>, Priority> {
  GetMainTaskByPriorityUsecase(super.repository);

  @override
  ResultFuture<List<MainTaskEntity>> call(Priority params) async =>
      await repository.getMainTasksByPriority(params);
}
