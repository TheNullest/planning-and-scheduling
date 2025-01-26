// import 'package:zamaan/core/repositories/base_crud_operations.dart';
// import 'package:zamaan/core/utils/try_catch.dart';
// import 'package:zamaan/core/utils/typedef.dart';
// import 'package:zamaan/features/task/data/data_sources/bases/goal_data_source.dart';
// import 'package:zamaan/features/task/data/models/local/goal_local_model.dart';
// import 'package:zamaan/features/task/domain/entities/goal_entity.dart';
// import 'package:zamaan/features/task/domain/repositories/goal_repository.dart';

// class GoalRepositoryImpl extends BaseCRUDOperations<GoalEntity, GoalLocalModel,
//     GoalDataSource<GoalLocalModel>> implements GoalRepository {
//   GoalRepositoryImpl(super.localDataSource)
//       : _localDataSource = localDataSource;
//   final GoalDataSource _localDataSource;

//   @override
//   GoalLocalModel fromEntity(GoalEntity entity) =>
//       GoalLocalModel.fromEntity(entity);

//   @override
//   GoalEntity toEntity(GoalLocalModel model) => model.toEntity();

//   @override
//   ResultFuture<List<GoalEntity>> getGoalsByMainTaskId(
//     String mainTaskId,
//   ) async =>
//       tryCatchEither<List<GoalEntity>>(() async {
//         final entities =
//             await _localDataSource.getGoalsByMainTaskId(mainTaskId);
//         return entities.map(
//           (either) => either
//               .map<GoalEntity>((model) => toEntity(model as GoalLocalModel))
//               .toList(),
//         );
//       });

//   @override
//   ResultFuture<GoalEntity> getGoalBySubTaskId(String subTaskId) async =>
//       tryCatchEither<GoalEntity>(() async {
//         final entity = await _localDataSource.getGoalBySubTaskId(subTaskId);
//         return entity
//             .map<GoalEntity>((model) => toEntity(model as GoalLocalModel));
//       });
// }
