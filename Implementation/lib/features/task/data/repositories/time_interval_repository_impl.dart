import 'package:dartz/dartz.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/repositories/base_crud_operations.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_time_interval_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_time_interval_model.dart';
import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';
import 'package:zamaan/features/task/domain/params/get_by_task_ids_and_date_range_params.dart';
import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';

class TimeIntervalRepositoryImpl extends BaseCRUDOperations<
    TimeIntervalEntity,
    HiveTimeIntervalModel,
    HiveTimeIntervalDataSourceImpl> implements TimeIntervalRepository {
  final HiveTimeIntervalDataSourceImpl _dataSource;

  TimeIntervalRepositoryImpl(
      {required HiveTimeIntervalDataSourceImpl dataSource})
      : _dataSource = dataSource,
        super(dataSource);

  @override
  HiveTimeIntervalModel fromEntity(TimeIntervalEntity entity) =>
      HiveTimeIntervalModel.fromEntity(entity);

  @override
  TimeIntervalEntity toEntity(HiveTimeIntervalModel model) => model.toEntity();

  Either<Failure, List<TimeIntervalEntity>> toEntities(
          Either<Failure, List<HiveTimeIntervalModel>> models) =>
      models.map((taskModels) => taskModels
          .map<TimeIntervalEntity>((taskModel) => taskModel.toEntity())
          .toList());

  @override
  ResultFuture<List<TimeIntervalEntity>>
      getTimeIntervalByMainTaskIdAndDateRange(
              GetByTaskIdsAndDateRangeParams params) async =>
          toEntities(await _dataSource.getTimeIntervalByMainTaskIdAndDateRange(
              params.mainTaskIds, params.startAt, params.endAt));

  @override
  ResultFuture<List<TimeIntervalEntity>> getTimeIntervalBySubTaskId(
          String subTaskId) async =>
      toEntities(await _dataSource.getTimeIntervalBySubTaskId(subTaskId));
}
