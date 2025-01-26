// import 'package:dartz/dartz.dart';
// import 'package:zamaan/core/enums/priority_enum.dart';
// import 'package:zamaan/core/enums/status_enum.dart';
// import 'package:zamaan/core/error/failures/failure.dart';
// import 'package:zamaan/core/repositories/base_crud_operations.dart';
// import 'package:zamaan/core/utils/typedef.dart';
// import 'package:zamaan/features/task/data/data_sources/bases/sub_task_data_source.dart';
// import 'package:zamaan/features/task/data/models/local/sub_task_local_model.dart';
// import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';
// import 'package:zamaan/features/task/domain/repositories/sub_task_repository.dart';

// class SubTaskRepositoryImpl extends BaseCRUDOperations<
//     SubTaskEntity,
//     SubTaskLocalModel,
//     SubTaskDataSource<SubTaskLocalModel>> implements SubTaskRepository {
//   SubTaskRepositoryImpl(super.localDataSource)
//       : _localDataSource = localDataSource;
//   final SubTaskDataSource _localDataSource;

//   @override
//   SubTaskLocalModel fromEntity(SubTaskEntity entity) =>
//       SubTaskLocalModel.fromEntity(entity);

//   @override
//   SubTaskEntity toEntity(SubTaskLocalModel model) => model.toEntity();

//   Either<Failure, List<SubTaskEntity>> toEntities(
//     Either<Failure, List<SubTaskLocalModel>> models,
//   ) =>
//       models.map(
//         (taskModels) => taskModels
//             .map<SubTaskEntity>((taskModel) => taskModel.toEntity())
//             .toList(),
//       );

//   @override
//   ResultFuture<List<SubTaskEntity>> getSubTasksByMainTaskId(
//     String mainTaskId,
//   ) async =>
//       toEntities(
//         await _localDataSource.getSubTasksByMainTaskId(mainTaskId)
//             as Either<Failure, List<SubTaskLocalModel>>,
//       );

//   @override
//   ResultFuture<List<SubTaskEntity>> getSubTasksByPriority(
//     Priority priority,
//   ) async =>
//       toEntities(
//         await _localDataSource.getSubTasksByPriority(priority)
//             as Either<Failure, List<SubTaskLocalModel>>,
//       );

//   @override
//   ResultFuture<List<SubTaskEntity>> getSubTasksByStatus(Status status) async =>
//       toEntities(
//         await _localDataSource.getSubTasksByStatus(status)
//             as Either<Failure, List<SubTaskLocalModel>>,
//       );
// }
