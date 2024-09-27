import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/utils/enums/enums.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';
import 'package:zamaan/features/task/domain/params/get_by_task_ids_and_date_range_params.dart';

abstract class TaskSchedulerRepository
    extends BaseRepositoryAbstraction<TaskSchedulerEntity> {
  // Additional search methods specific to ScheduledTimeEntity

  /// Retrieves scheduled times by a list of main task IDs and an optional date range.
  ///
  /// In the **`[params]`** :
  /// - [mainTaskIds] - The list of main task IDs to filter by.
  /// - [startAt] - The optional start date of the range.
  /// - [endAt] - The optional end date of the range.
  /// Returns a `ResultFuture<List<ScheduledTimeEntity>>` containing the matching scheduled times.
  ResultFuture<List<TaskSchedulerEntity>>
      getTaskSchedulerByMainTaskIdsAndDateRange(
          GetByTaskIdsAndDateRangeParams params);

  /// Retrieves scheduled times by the main task ID.
  ///
  /// - [mainTaskId] - The ID of the main task.
  /// Returns a `ResultFuture<List<ScheduledTimeEntity>>` containing the matching scheduled times.
  ResultFuture<List<TaskSchedulerEntity>> getTaskSchedulersByMainTaskId(
      String mainTaskId);

  /// Retrieves scheduled times by their start time.
  ///
  /// - [startTime] - The start time of the scheduled times.
  /// Returns a `ResultFuture<List<ScheduledTimeEntity>>` containing the matching scheduled times.
  ResultFuture<List<TaskSchedulerEntity>> getTaskSchedulersByStartTime(
      DateTime startTime);

  /// Retrieves scheduled times by their repetition type.
  ///
  /// - [repetitionType] - The repetition type of the scheduled times.
  /// Returns a `ResultFuture<List<ScheduledTimeEntity>>` containing the matching scheduled times.
  ResultFuture<List<TaskSchedulerEntity>> getTaskSchedulersByRepetitionType(
      RepetitionType repetitionType);

  /// Retrieves scheduled times by their time unit.
  ///
  /// [timeUnit] - The time unit of the scheduled times, based on the `TimeUnit` enum.
  /// - `index`.`type`.`value` : `description`
  /// - `0.TimeUnit.minute`: Represents a minute.
  /// - `1.TimeUnit.hour`: Represents an hour.
  /// - `2.TimeUnit.day`: Represents a day.
  /// - `3.TimeUnit.week`: Represents a week.
  /// - `4.TimeUnit.month`: Represents a month.
  /// - `5.TimeUnit.year`: Represents a year.
  ///
  /// Returns a `ResultFuture<List<ScheduledTimeEntity>>` containing the matching scheduled times.
  ResultFuture<List<TaskSchedulerEntity>> getTaskSchedulersByTimeUnit(
      TimeUnit timeUnit);

  /// Retrieves scheduled times by their specific times.
  ///
  /// [specificTimes] - The specific times of the scheduled times.
  /// Returns a `ResultFuture<List<ScheduledTimeEntity>>` containing the matching scheduled times.
  ResultFuture<List<TaskSchedulerEntity>> getTaskSchedulersBySpecificTimes(
      List<int> specificTimes);

  /// Retrieves scheduled times by their end time.
  ///
  /// - [endTime] - The end time of the scheduled times.
  /// Returns a `ResultFuture<List<ScheduledTimeEntity>>` containing the matching scheduled times.
  ResultFuture<List<TaskSchedulerEntity>> getTaskSchedulersByEndTime(
      DateTime endTime);

  /// Retrieves scheduled times within a specific date range.
  ///
  /// - [startDate] - The start date of the range.
  /// - [endDate] - The end date of the range.
  /// Returns a `ResultFuture<List<ScheduledTimeEntity>>` containing the matching scheduled times.
  ResultFuture<List<TaskSchedulerEntity>> getTaskSchedulersWithinDateRange(
      DateTime startDate, DateTime endDate);
}
