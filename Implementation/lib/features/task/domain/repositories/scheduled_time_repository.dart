import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/scheduled_time_entity.dart';

abstract class ScheduledTimeRepository
    extends BaseRepositoryAbstraction<ScheduledTimeEntity> {
  ResultFuture<List<ScheduledTimeEntity>> getScheduledTimeByTaskIdsAndDateRange(
      List<String> mainTaskIds, DateTime? startAt, DateTime? endAt);
  ResultFuture<List<ScheduledTimeEntity>> getScheduledTimeByTaskId(
      String mainTaskId);
}
