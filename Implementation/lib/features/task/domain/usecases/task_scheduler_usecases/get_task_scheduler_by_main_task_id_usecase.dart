import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';
import 'package:zamaan/features/task/domain/repositories/task_scheduler_repository.dart';

class GetTaskSchedulerByTaskIdUsecase extends UseCaseWithParams<
    TaskSchedulerRepository, List<TaskSchedulerEntity>, String> {
  GetTaskSchedulerByTaskIdUsecase(super.repository);

  @override
  ResultFuture<List<TaskSchedulerEntity>> call(String params) async =>
      repository.getTaskSchedulersByMainTaskId(params);
}
