import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';
import 'package:zamaan/features/task/domain/params/get_by_task_ids_and_date_range_params.dart';
import 'package:zamaan/features/task/domain/repositories/task_scheduler_repository.dart';

class GetTaskSchedulerByTaskIdsAndDateRangeUsecase extends UseCaseWithParams<
    TaskSchedulerEntity,
    TaskSchedulerRepository,
    List<TaskSchedulerEntity>,
    GetByTaskIdsAndDateRangeParams> {
  GetTaskSchedulerByTaskIdsAndDateRangeUsecase(super.repository);

  @override
  ResultFuture<List<TaskSchedulerEntity>> call(
          GetByTaskIdsAndDateRangeParams params) async =>
      await repository.getTaskSchedulerByMainTaskIdsAndDateRange(params);
}
