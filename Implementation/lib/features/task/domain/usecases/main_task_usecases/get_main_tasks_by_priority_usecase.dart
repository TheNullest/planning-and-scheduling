import 'package:zamaan/core/enums/enums.dart';
import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class GetMainTasksByPriorityUsecase extends UseCaseWithParams<
    MainTaskRepository, List<MainTaskEntity>, Priority> {
  GetMainTasksByPriorityUsecase(super.repository);

  @override
  ResultFuture<List<MainTaskEntity>> call(Priority params) async =>
      repository.getMainTasksByPriority(params);
}
