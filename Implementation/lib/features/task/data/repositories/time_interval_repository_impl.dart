// import 'package:dartz/dartz.dart';
// import 'package:zamaan/core/error/failures/failure.dart';
// import 'package:zamaan/core/repositories/base_crud_operations.dart';
// import 'package:zamaan/core/utils/typedef.dart';
// import 'package:zamaan/features/task/data/data_sources/bases/time_interval_data_source.dart';
// import 'package:zamaan/features/task/data/models/local/time_interval_local_model.dart';
// import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';
// import 'package:zamaan/features/task/domain/params/get_by_task_ids_and_date_range_params.dart';
// import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';

// class TimeIntervalRepositoryImpl extends BaseCRUDOperations<TimeIntervalEntity,
//         TimeIntervalLocalModel, TimeIntervalDataSource<TimeIntervalLocalModel>>
//     implements TimeIntervalRepository {
//   TimeIntervalRepositoryImpl(super.localDataSource)
//       : _localDataSource = localDataSource;
//   final TimeIntervalDataSource _localDataSource;

//   @override
//   TimeIntervalLocalModel fromEntity(TimeIntervalEntity entity) =>
//       TimeIntervalLocalModel.fromEntity(entity);

//   @override
//   TimeIntervalEntity toEntity(TimeIntervalLocalModel model) => model.toEntity();

//   Either<Failure, List<TimeIntervalEntity>> toEntities(
//     Either<Failure, List<TimeIntervalLocalModel>> models,
//   ) =>
//       models.map(
//         (taskModels) => taskModels
//             .map<TimeIntervalEntity>((taskModel) => taskModel.toEntity())
//             .toList(),
//       );

//   @override
//   ResultFuture<List<TimeIntervalEntity>>
//       getTimeIntervalByMainTaskIdAndDateRange(
//     GetByTaskIdsAndDateRangeParams params,
//   ) async =>
//           toEntities(
//             await _localDataSource.getTimeIntervalByMainTaskIdAndDateRange(
//               mainTaskIds: params.mainTaskIds,
//               startAt: params.startAt,
//               endAt: params.endAt,
//             ) as Either<Failure, List<TimeIntervalLocalModel>>,
//           );

//   @override
//   ResultFuture<List<TimeIntervalEntity>> getTimeIntervalBySubTaskId(
//     String subTaskId,
//   ) async =>
//       toEntities(
//         await _localDataSource.getTimeIntervalBySubTaskId(subTaskId)
//             as Either<Failure, List<TimeIntervalLocalModel>>,
//       );
// }
