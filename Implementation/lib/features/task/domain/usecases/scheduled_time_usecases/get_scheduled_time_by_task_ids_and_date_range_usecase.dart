import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/scheduled_time_entity.dart';
import 'package:zamaan/features/task/domain/params/get_by_task_ids_and_date_range_params.dart';
import 'package:zamaan/features/task/domain/repositories/scheduled_time_repository.dart';

class GetScheduledTimeByTaskIdsAndDateRangeUsecase extends UseCaseWithParams<
    ScheduledTimeRepository,
    List<ScheduledTimeEntity>,
    GetByTaskIdsAndDateRangeParams> {
  GetScheduledTimeByTaskIdsAndDateRangeUsecase(super.repository);

  @override
  ResultFuture<List<ScheduledTimeEntity>> call(
          GetByTaskIdsAndDateRangeParams params) async =>
      await repository.getScheduledTimeByTaskIdsAndDateRange(
          params.mainTaskIds, params.startAt, params.endAt);
}
