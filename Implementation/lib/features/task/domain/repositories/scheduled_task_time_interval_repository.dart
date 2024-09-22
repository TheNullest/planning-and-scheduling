import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/scheduled_task_time_interval_entity.dart';

abstract class ScheduledTaskTimeIntervalRepository
    extends BaseRepositoryAbstraction<ScheduledTaskTimeIntervalEntity> {
  ResultFuture<List<ScheduledTaskTimeIntervalEntity>>
      getScheduledTaskTimeIntervalByMainTaskIdAndDateRange(
          List<String> mainTaskIds, DateTime? startAt, DateTime? endAt);
  ResultFuture<List<ScheduledTaskTimeIntervalEntity>>
      getScheduledTaskTimeIntervalByMainTaskId(String mainTaskId);
}
