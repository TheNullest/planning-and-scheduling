import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/task_time_interval_entity.dart';

abstract class TaskTimeIntervalRepository
    extends BaseRepositoryAbstraction<TaskTimeIntervalEntity> {
  ResultFuture<List<TaskTimeIntervalEntity>>
      getTaskTimeIntervalByMainTaskIdAndDateRange(
          List<String> mainTaskIds, DateTime? startAt, DateTime? endAt);
  ResultFuture<List<TaskTimeIntervalEntity>> getTaskTimeIntervalByMainTaskId(
      String mainTaskId);
  ResultFuture<List<TaskTimeIntervalEntity>> getTaskTimeIntervalBySubTaskId(
      String subTaskId);
}
