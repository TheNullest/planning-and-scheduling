import 'package:zamaan/core/data_sources/base_data_source_abstraction.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';

abstract class TimeIntervalDataSource<
        TimeIntervalModel extends TimeIntervalEntity>
    extends BaseDataSourceAbstraction<TimeIntervalModel> {
  /// Retrieves tasks based on a specific main task ID.
  ///
  /// [mainTaskId] - The main task ID to filter the tasks.
  ///
  /// Returns a [ResultFuture] containing a list of [TimeIntervalModel] objects.
  ResultFuture<List<TimeIntervalModel>> getScheduledTimesByMainTaskId(
    String mainTaskId,
  );

  /// Retrieves a list of [TimeIntervalModel] by main task IDs and date range.
  ///
  /// [mainTaskIds] - List of main task IDs to filter the time intervals.
  /// [startAt] - Start date of the date range.
  /// [endAt] - End date of the date range.
  /// Returns a [ResultFuture] containing a list of [TimeIntervalModel].
  ResultFuture<List<TimeIntervalModel>>
      getTimeIntervalByMainTaskIdAndDateRange({
    required List<String> mainTaskIds,
    required DateTime? startAt,
    required DateTime? endAt,
  });

  /// Retrieves a list of [TimeIntervalModel] by sub task ID.
  ///
  /// [subTaskId] - Sub task ID to filter the time intervals.
  /// Returns a [ResultFuture] containing a list of [TimeIntervalModel].
  ResultFuture<List<TimeIntervalModel>> getTimeIntervalBySubTaskId(
    String subTaskId,
  );
}
