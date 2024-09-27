import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';
import 'package:zamaan/features/task/domain/params/get_by_task_ids_and_date_range_params.dart';

abstract class TimeIntervalRepository
    extends BaseRepositoryAbstraction<TimeIntervalEntity> {
  ResultFuture<List<TimeIntervalEntity>>
      getTimeIntervalByMainTaskIdAndDateRange(
          GetByTaskIdsAndDateRangeParams params);
  ResultFuture<List<TimeIntervalEntity>> getTimeIntervalBySubTaskId(
      String subTaskId);
}
