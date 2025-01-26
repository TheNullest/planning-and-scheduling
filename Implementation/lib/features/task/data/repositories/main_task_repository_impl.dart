// import 'package:dartz/dartz.dart';
// import 'package:zamaan/core/enums/enums.dart';
// import 'package:zamaan/core/error/failures/failure.dart';
// import 'package:zamaan/core/repositories/base_crud_operations.dart';
// import 'package:zamaan/core/utils/typedef.dart';
// import 'package:zamaan/features/task/data/data_sources/bases/main_task_data_source.dart';
// import 'package:zamaan/features/task/data/models/local/main_task_local_model.dart';
// import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
// import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

// class MainTaskRepositoryImpl extends BaseCRUDOperations<
//     MainTaskEntity,
//     MainTaskLocalModel,
//     MainTaskDataSource<MainTaskLocalModel>> implements MainTaskRepository {
//   MainTaskRepositoryImpl(super.localDataSource)
//       : _localDataSource = localDataSource;
//   final MainTaskDataSource _localDataSource;

//   @override
//   MainTaskLocalModel fromEntity(MainTaskEntity entity) =>
//       MainTaskLocalModel.fromEntity(entity);

//   @override
//   MainTaskEntity toEntity(MainTaskLocalModel model) => model.toEntity();

//   Either<Failure, List<MainTaskEntity>> toEntities(
//     Either<Failure, List<MainTaskLocalModel>> models,
//   ) =>
//       models.map(
//         (taskModels) => taskModels
//             .map<MainTaskEntity>((taskModel) => taskModel.toEntity())
//             .toList(),
//       );

//   @override
//   ResultFuture<List<MainTaskEntity>> getMainTasksByCategories(
//     List<String> categoryIds,
//   ) async =>
//       toEntities(
//         await _localDataSource.getMainTasksByCategories(categoryIds)
//             as Either<Failure, List<MainTaskLocalModel>>,
//       );

//   @override
//   ResultFuture<List<MainTaskEntity>> getMainTasksByDueDate(
//     DateTime dueDate,
//   ) async =>
//       toEntities(
//         await _localDataSource.getMainTasksByDueDate(dueDate)
//             as Either<Failure, List<MainTaskLocalModel>>,
//       );

//   @override
//   ResultFuture<List<MainTaskEntity>> getMainTasksByPriority(
//     Priority priority,
//   ) async =>
//       toEntities(
//         await _localDataSource.getMainTasksByPriority(priority)
//             as Either<Failure, List<MainTaskLocalModel>>,
//       );

//   @override
//   ResultFuture<List<MainTaskEntity>> getMainTasksByStatus(
//     Status status,
//   ) async =>
//       toEntities(
//         await _localDataSource.getMainTasksByStatus(status)
//             as Either<Failure, List<MainTaskLocalModel>>,
//       );

//   @override
//   ResultFuture<List<MainTaskEntity>> getMainTasksByTags(
//     List<String> tagIds,
//   ) async =>
//       toEntities(
//         await _localDataSource.getMainTasksByTags(tagIds)
//             as Either<Failure, List<MainTaskLocalModel>>,
//       );

//   @override
//   ResultFuture<MainTaskEntity> getMainTaskByTaskSchedulerId(
//     String schedulerId,
//   ) async {
//     final result =
//         await _localDataSource.getMainTaskByTaskSchedulerId(schedulerId);
//     return result.map((model) => toEntity(model as MainTaskLocalModel));
//   }
// }
