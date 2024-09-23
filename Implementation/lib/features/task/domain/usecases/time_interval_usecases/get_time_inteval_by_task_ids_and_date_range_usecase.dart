import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/task_time_interval_entity.dart';
import 'package:zamaan/features/task/domain/params/get_by_task_ids_and_date_range_params.dart';
import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';

class GetTimeIntevalByTaskIdsAndDateRangeUsecase extends UseCaseWithParams<
    TimeIntervalRepository,
    List<TimeIntervalEntity>,
    GetByTaskIdsAndDateRangeParams> {
  GetTimeIntevalByTaskIdsAndDateRangeUsecase(super.repository);

  @override
  ResultFuture<List<TimeIntervalEntity>> call(
          GetByTaskIdsAndDateRangeParams params) async =>
      await repository.getTimeIntervalByMainTaskIdAndDateRange(
          params.mainTaskIds, params.startAt, params.endAt);
}
