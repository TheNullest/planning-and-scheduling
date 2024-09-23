import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/task_time_interval_entity.dart';

abstract class TimeIntervalRepository
    extends BaseRepositoryAbstraction<TimeIntervalEntity> {
  ResultFuture<List<TimeIntervalEntity>>
      getTimeIntervalByMainTaskIdAndDateRange(
          List<String> mainTaskIds, DateTime? startAt, DateTime? endAt);
  ResultFuture<List<TimeIntervalEntity>> getTimeIntervalByMainTaskId(
      String mainTaskId);
  ResultFuture<List<TimeIntervalEntity>> getTimeIntervalBySubTaskId(
      String subTaskId);
}
