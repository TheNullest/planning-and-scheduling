import 'package:zamaan/core/data_sources/base_data_source_abstraction.dart';
import 'package:zamaan/core/data_sources/base_local_data_source_abstraction.dart';
import 'package:zamaan/core/enums/enums.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';

/// A data source implementation for managing task scheduling data using Hive.
///
/// This class extends [BaseLocalDataSourceAbstraction] to leverage common data
/// operations
/// and provides additional methods for specific task-related queries.
abstract class TaskSchedulerDataSource<
        TaskSchedulerModel extends TaskSchedulerEntity>
    extends BaseDataSourceAbstraction<TaskSchedulerModel> {
  /// Retrieves tasks based on main task IDs and a date range.
  ///
  /// [mainTaskIds] - List of main task IDs to filter the tasks.
  /// [startAt] - Start date for the date range filter.
  /// [endAt] - End date for the date range filter.
  ///
  /// Returns a [ResultFuture] containing a list of [TaskSchedulerModel]
  /// objects.
  ResultFuture<List<TaskSchedulerModel>>
      getTaskSchedulersByMainTaskIdsAndDateRange({
    required List<String> mainTaskIds,
    required DateTime? startAt,
    required DateTime? endAt,
  });

  /// Retrieves tasks scheduled before a specific end time.
  ///
  /// [endAt] - The end time to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [TaskSchedulerModel]
  /// objects.
  ResultFuture<List<TaskSchedulerModel>> getTaskSchedulersByEndTime(
    DateTime endAt,
  );

  /// Retrieves tasks based on a specific main task ID.
  ///
  /// [mainTaskId] - The main task ID to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [TaskSchedulerModel]
  /// objects.
  ResultFuture<List<TaskSchedulerModel>> getTaskSchedulersByMainTaskId(
    String mainTaskId,
  );

  /// Retrieves tasks based on a repetition type.
  ///
  /// [repetitionType] - The repetition type to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [TaskSchedulerModel]
  /// objects.
  ResultFuture<List<TaskSchedulerModel>> getTaskSchedulersByRepetitionType(
    RepetitionType repetitionType,
  );

  /// Retrieves tasks based on specific times.
  ///
  /// [specificTimes] - List of specific times to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [TaskSchedulerModel]
  /// objects.
  ResultFuture<List<TaskSchedulerModel>> getTaskSchedulersBySpecificTimes(
    List<int> specificTimes,
  );

  /// Retrieves tasks scheduled after a specific start time.
  ///
  /// [startAt] - The start time to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [TaskSchedulerModel]
  /// objects.
  ResultFuture<List<TaskSchedulerModel>> getTaskSchedulersByStartTime(
    DateTime startAt,
  );

  /// Retrieves tasks based on a time unit.
  ///
  /// [timeUnit] - The time unit to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [TaskSchedulerModel]
  /// objects.
  ResultFuture<List<TaskSchedulerModel>> getTaskSchedulersByTimeUnit(
    TimeUnit timeUnit,
  );

  /// Retrieves tasks within a specific date range.
  ///
  /// [startDate] - The start date for the date range filter.
  /// [endDate] - The end date for the date range filter.
  ///
  /// Returns a [ResultFuture] containing a list of [TaskSchedulerModel]
  /// objects.
  ResultFuture<List<TaskSchedulerModel>> getTaskSchedulersWithinDateRange({
    required DateTime startDate,
    required DateTime endDate,
  });
}
