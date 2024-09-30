import 'package:zamaan/core/utils/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/hive_base_data_source_abstraction.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/data/models/local/hive_time_interval_model.dart';

class HiveTimeIntervalDataSourceImpl
    extends HiveBaseDataSourceAbstraction<HiveTimeIntervalModel> {
  final String _boxName;
  final HiveInitializer<HiveTimeIntervalModel> _hiveBox;

  // Just to add the testability feature to the class,
  // we need to inject the [HiveInitializer<HiveTimeIntervalModel>] like this
  HiveTimeIntervalDataSourceImpl(
      {HiveInitializer<HiveTimeIntervalModel>? hiveBox})
      : _hiveBox = hiveBox ?? HiveInitializer<HiveTimeIntervalModel>(),
        _boxName = HiveBoxConstants.TIME_INTERVAL_BOX,
        super(
          HiveBoxConstants.TIME_INTERVAL_BOX,
          hiveBox: hiveBox,
        );

  /// Retrieves tasks based on a specific main task ID.
  ///
  /// [mainTaskId] - The main task ID to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [HiveTimeIntervalModel] objects.
  ResultFuture<List<HiveTimeIntervalModel>> getScheduledTimesByMainTaskId(
      String mainTaskId) async {
    return await _hiveBox.operator<List<HiveTimeIntervalModel>>(
      job: (box) async =>
          box.values.where((task) => task.mainTaskId == mainTaskId).toList(),
      boxName: _boxName,
    );
  }

  /// Retrieves a list of [HiveTimeIntervalModel] by main task IDs and date range.
  ///
  /// [mainTaskIds] - List of main task IDs to filter the time intervals.
  /// [startAt] - Start date of the date range.
  /// [endAt] - End date of the date range.
  /// Returns a [ResultFuture] containing a list of [HiveTimeIntervalModel].
  ResultFuture<List<HiveTimeIntervalModel>>
      getTimeIntervalByMainTaskIdAndDateRange(
          {required List<String> mainTaskIds,
          required DateTime? startAt,
          required DateTime? endAt}) async {
    return await _hiveBox.operator<List<HiveTimeIntervalModel>>(
      job: (box) async {
        return box.values.where((timeInterval) {
          final isInDateRange =
              (startAt == null || timeInterval.startAt.isAfter(startAt)) &&
                  (endAt == null || timeInterval.endAt!.isBefore(endAt));
          final isInMainTaskIds = mainTaskIds.contains(timeInterval.mainTaskId);
          return isInDateRange && isInMainTaskIds;
        }).toList();
      },
      boxName: _boxName,
    );
  }

  /// Retrieves a list of [HiveTimeIntervalModel] by sub task ID.
  ///
  /// [subTaskId] - Sub task ID to filter the time intervals.
  /// Returns a [ResultFuture] containing a list of [HiveTimeIntervalModel].
  ResultFuture<List<HiveTimeIntervalModel>> getTimeIntervalBySubTaskId(
      String subTaskId) async {
    return await _hiveBox.operator<List<HiveTimeIntervalModel>>(
      job: (box) async {
        return box.values
            .where((timeInterval) => timeInterval.subTaskId == subTaskId)
            .toList();
      },
      boxName: _boxName,
    );
  }
}
