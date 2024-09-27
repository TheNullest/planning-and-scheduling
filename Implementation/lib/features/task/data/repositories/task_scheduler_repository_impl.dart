import 'package:dartz/dartz.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/repositories/base_crud_operations.dart';
import 'package:zamaan/core/utils/enums/enums.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_task_scheduler_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_task_scheduler_model.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';
import 'package:zamaan/features/task/domain/params/get_by_task_ids_and_date_range_params.dart';
import 'package:zamaan/features/task/domain/repositories/task_scheduler_repository.dart';

class ScheduledTimeRepositoryImpl extends BaseCRUDOperations<
    TaskSchedulerEntity,
    HiveTaskSchedulerModel,
    HiveTaskSchedulerDataSourceImpl> implements TaskSchedulerRepository {
  final HiveTaskSchedulerDataSourceImpl _dataSource;

  ScheduledTimeRepositoryImpl(
      {required HiveTaskSchedulerDataSourceImpl dataSource})
      : _dataSource = dataSource,
        super(dataSource);

  @override
  HiveTaskSchedulerModel fromEntity(TaskSchedulerEntity entity) =>
      HiveTaskSchedulerModel.fromEntity(entity);

  @override
  TaskSchedulerEntity toEntity(HiveTaskSchedulerModel model) =>
      model.toEntity();

  Either<Failure, List<TaskSchedulerEntity>> toEntities(
          Either<Failure, List<HiveTaskSchedulerModel>> models) =>
      models.map((taskModels) => taskModels
          .map<TaskSchedulerEntity>((taskModel) => taskModel.toEntity())
          .toList());

  @override
  ResultFuture<
      List<TaskSchedulerEntity>> getTaskSchedulerByMainTaskIdsAndDateRange(
          GetByTaskIdsAndDateRangeParams params) async =>
      toEntities(await _dataSource.getTaskSchedulerByMainTaskIdsAndDateRange(
        params.mainTaskIds,
        params.startAt,
        params.endAt,
      ));

  @override
  ResultFuture<List<TaskSchedulerEntity>> getTaskSchedulersByEndTime(
          DateTime endTime) async =>
      toEntities(await _dataSource.getTaskSchedulersByEndTime(endTime));

  @override
  ResultFuture<List<TaskSchedulerEntity>> getTaskSchedulersByMainTaskId(
          String mainTaskId) async =>
      toEntities(await _dataSource.getTaskSchedulersByMainTaskId(mainTaskId));

  @override
  ResultFuture<List<TaskSchedulerEntity>> getTaskSchedulersByRepetitionType(
          RepetitionType repetitionType) async =>
      toEntities(
          await _dataSource.getTaskSchedulersByRepetitionType(repetitionType));

  @override
  ResultFuture<List<TaskSchedulerEntity>> getTaskSchedulersBySpecificTimes(
          List<int> specificTimes) async =>
      toEntities(
          await _dataSource.getTaskSchedulersBySpecificTimes(specificTimes));

  @override
  ResultFuture<List<TaskSchedulerEntity>> getTaskSchedulersByStartTime(
          DateTime startTime) async =>
      toEntities(await _dataSource.getTaskSchedulersByStartTime(startTime));

  @override
  ResultFuture<List<TaskSchedulerEntity>> getTaskSchedulersByTimeUnit(
          TimeUnit timeUnit) async =>
      toEntities(await _dataSource.getTaskSchedulersByTimeUnit(timeUnit));
  @override
  ResultFuture<List<TaskSchedulerEntity>> getTaskSchedulersWithinDateRange(
          DateTime startDate, DateTime endDate) async =>
      toEntities(await _dataSource.getTaskSchedulersWithinDateRange(
          startDate, endDate));
}
