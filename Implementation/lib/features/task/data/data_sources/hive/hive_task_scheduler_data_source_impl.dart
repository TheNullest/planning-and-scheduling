import 'package:zamaan/core/utils/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/hive_base_data_source_abstraction.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/core/utils/enums/enums.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/data/models/local/hive_task_scheduler_model.dart';

/// A data source implementation for managing task scheduling data using Hive.
///
/// This class extends [HiveBaseDataSourceAbstraction] to leverage common data operations
/// and provides additional methods for specific task-related queries.
class HiveTaskSchedulerDataSourceImpl
    extends HiveBaseDataSourceAbstraction<HiveTaskSchedulerModel> {
  final String _boxName;
  final HiveInitializer<HiveTaskSchedulerModel> _hiveBox;

  /// Constructor for [HiveTaskSchedulerDataSourceImpl].
  ///
  /// The [hiveBox] parameter is optional and allows for dependency injection
  /// to facilitate testing. If not provided, a default [HiveInitializer] is used.
  HiveTaskSchedulerDataSourceImpl(
      {HiveInitializer<HiveTaskSchedulerModel>? hiveBox})
      : _hiveBox = hiveBox ?? HiveInitializer<HiveTaskSchedulerModel>(),
        _boxName = HiveBoxConstants.TASK_SCHEDULERS_BOX,
        super(hiveBox: hiveBox, HiveBoxConstants.TASK_SCHEDULERS_BOX);

  /// Retrieves tasks based on main task IDs and a date range.
  ///
  /// [mainTaskIds] - List of main task IDs to filter the tasks.
  /// [startAt] - Start date for the date range filter.
  /// [endAt] - End date for the date range filter.
  ///
  /// Returns a [ResultFuture] containing a list of [HiveTaskSchedulerModel] objects.
  ResultFuture<List<HiveTaskSchedulerModel>>
      getTaskSchedulersByMainTaskIdsAndDateRange(
              {required List<String> mainTaskIds,
              required DateTime? startAt,
              required DateTime? endAt}) async =>
          await _hiveBox.operator<List<HiveTaskSchedulerModel>>(
            job: (box) async => box.values.where((task) {
              final isWithinDateRange =
                  (startAt == null || task.willStartAt!.isAfter(startAt)) &&
                      (endAt == null || task.endAt!.isBefore(endAt));
              if (!isWithinDateRange) return false;
              return mainTaskIds.contains(task.mainTaskId);
            }).toList(),
            boxName: _boxName,
          );

  /// Retrieves tasks scheduled before a specific end time.
  ///
  /// [endAt] - The end time to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [HiveTaskSchedulerModel] objects.
  ResultFuture<List<HiveTaskSchedulerModel>> getTaskSchedulersByEndTime(
      DateTime endAt) async {
    return await _hiveBox.operator<List<HiveTaskSchedulerModel>>(
      job: (box) async =>
          box.values.where((task) => task.endAt!.isBefore(endAt)).toList(),
      boxName: _boxName,
    );
  }

  /// Retrieves tasks based on a specific main task ID.
  ///
  /// [mainTaskId] - The main task ID to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [HiveTaskSchedulerModel] objects.
  ResultFuture<List<HiveTaskSchedulerModel>> getTaskSchedulersByMainTaskId(
      String mainTaskId) async {
    return await _hiveBox.operator<List<HiveTaskSchedulerModel>>(
      job: (box) async =>
          box.values.where((task) => task.mainTaskId == mainTaskId).toList(),
      boxName: _boxName,
    );
  }

  /// Retrieves tasks based on a repetition type.
  ///
  /// [repetitionType] - The repetition type to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [HiveTaskSchedulerModel] objects.
  ResultFuture<List<HiveTaskSchedulerModel>> getTaskSchedulersByRepetitionType(
      RepetitionType repetitionType) async {
    return await _hiveBox.operator<List<HiveTaskSchedulerModel>>(
      job: (box) async => box.values
          .where((task) => task.repetitionType == repetitionType.index)
          .toList(),
      boxName: _boxName,
    );
  }

  /// Retrieves tasks based on specific times.
  ///
  /// [specificTimes] - List of specific times to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [HiveTaskSchedulerModel] objects.
  ResultFuture<List<HiveTaskSchedulerModel>> getTaskSchedulersBySpecificTimes(
      List<int> specificTimes) async {
    return await _hiveBox.operator<List<HiveTaskSchedulerModel>>(
      job: (box) async => box.values
          .where((task) =>
              specificTimes.any((sTime) => task.specificTimes!.contains(sTime)))
          .toList(),
      boxName: _boxName,
    );
  }

  /// Retrieves tasks scheduled after a specific start time.
  ///
  /// [startAt] - The start time to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [HiveTaskSchedulerModel] objects.
  ResultFuture<List<HiveTaskSchedulerModel>> getTaskSchedulersByStartTime(
      DateTime startAt) async {
    return await _hiveBox.operator<List<HiveTaskSchedulerModel>>(
      job: (box) async => box.values
          .where((task) => task.willStartAt!.isAfter(startAt))
          .toList(),
      boxName: _boxName,
    );
  }

  /// Retrieves tasks based on a time unit.
  ///
  /// [timeUnit] - The time unit to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [HiveTaskSchedulerModel] objects.
  ResultFuture<List<HiveTaskSchedulerModel>> getTaskSchedulersByTimeUnit(
      TimeUnit timeUnit) async {
    return await _hiveBox.operator<List<HiveTaskSchedulerModel>>(
      job: (box) async =>
          box.values.where((task) => task.timeUnit == timeUnit.index).toList(),
      boxName: _boxName,
    );
  }

  /// Retrieves tasks within a specific date range.
  ///
  /// [startDate] - The start date for the date range filter.
  /// [endDate] - The end date for the date range filter.
  ///
  /// Returns a [ResultFuture] containing a list of [HiveTaskSchedulerModel] objects.
  ResultFuture<List<HiveTaskSchedulerModel>> getTaskSchedulersWithinDateRange(
          {required DateTime startDate, required DateTime endDate}) async =>
      await _hiveBox.operator<List<HiveTaskSchedulerModel>>(
        job: (box) async => box.values
            .where((task) =>
                task.willStartAt!.isAfter(startDate) &&
                task.endAt!.isBefore(endDate))
            .toList(),
        boxName: _boxName,
      );
}
