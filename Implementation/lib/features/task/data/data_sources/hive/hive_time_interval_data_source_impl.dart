import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/base_local_data_source_abstraction.dart';
import 'package:zamaan/core/services/hive_services.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/data/data_sources/bases/time_interval_data_source.dart';
import 'package:zamaan/features/task/data/models/local/local_models.dart';

class HiveTimeIntervalDataSourceImpl
    extends BaseLocalDataSourceAbstraction<TimeIntervalLocalModel>
    implements TimeIntervalDataSource<TimeIntervalLocalModel> {
  // Just to add the testability feature to the class,
  // we need to inject the [HiveInitializer<TimeIntervalLocalModel>] like this
  HiveTimeIntervalDataSourceImpl({
    HiveServices<TimeIntervalLocalModel>? hiveBox,
  })  : _hiveBox = hiveBox ?? HiveServices<TimeIntervalLocalModel>(),
        _boxName = HiveBoxConstants.TIME_INTERVAL_BOX,
        super(
          HiveBoxConstants.TIME_INTERVAL_BOX,
          hiveBox: hiveBox,
        );
  final String _boxName;
  final HiveServices<TimeIntervalLocalModel> _hiveBox;

  /// Retrieves tasks based on a specific main task ID.
  ///
  /// [mainTaskId] - The main task ID to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [TimeIntervalLocalModel] objects.
  @override
  ResultFuture<List<TimeIntervalLocalModel>> getScheduledTimesByMainTaskId(
    String mainTaskId,
  ) async {
    return _hiveBox.operator<List<TimeIntervalLocalModel>>(
      job: (box) async =>
          box.values.where((task) => task.mainTaskId == mainTaskId).toList(),
      boxName: _boxName,
    );
  }

  /// Retrieves a list of [TimeIntervalLocalModel] by main task IDs and date range.
  ///
  /// [mainTaskIds] - List of main task IDs to filter the time intervals.
  /// [startAt] - Start date of the date range.
  /// [endAt] - End date of the date range.
  /// Returns a [ResultFuture] containing a list of [TimeIntervalLocalModel].
  @override
  ResultFuture<List<TimeIntervalLocalModel>>
      getTimeIntervalByMainTaskIdAndDateRange({
    required List<String> mainTaskIds,
    required DateTime? startAt,
    required DateTime? endAt,
  }) async {
    return _hiveBox.operator<List<TimeIntervalLocalModel>>(
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

  /// Retrieves a list of [TimeIntervalLocalModel] by sub task ID.
  ///
  /// [subTaskId] - Sub task ID to filter the time intervals.
  /// Returns a [ResultFuture] containing a list of [TimeIntervalLocalModel].
  @override
  ResultFuture<List<TimeIntervalLocalModel>> getTimeIntervalBySubTaskId(
    String subTaskId,
  ) async {
    return _hiveBox.operator<List<TimeIntervalLocalModel>>(
      job: (box) async {
        return box.values
            .where((timeInterval) => timeInterval.subTaskId == subTaskId)
            .toList();
      },
      boxName: _boxName,
    );
  }
}
