import 'package:zamaan/core/repositories/base_crud_operations.dart';
import 'package:zamaan/core/utils/try_catch.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_goal_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_goal_model.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';
import 'package:zamaan/features/task/domain/repositories/goal_repository.dart';

class GoalRepositoryImpl extends BaseCRUDOperations<GoalEntity, HiveGoalModel,
    HiveGoalDataSourceImpl> implements GoalRepository {
  final HiveGoalDataSourceImpl _dataSource;

  GoalRepositoryImpl({required HiveGoalDataSourceImpl dataSource})
      : _dataSource = dataSource,
        super(dataSource);

  @override
  HiveGoalModel fromEntity(GoalEntity entity) =>
      HiveGoalModel.fromEntity(entity);

  @override
  GoalEntity toEntity(HiveGoalModel model) => model.toEntity();

  @override
  ResultFuture<List<GoalEntity>> getGoalsByMainTaskId(
          String mainTaskId) async =>
      tryCatch<List<GoalEntity>>(() async {
        var entities = await _dataSource.getGoalsByMainTaskId(mainTaskId);
        return entities.map((either) =>
            either.map<GoalEntity>((model) => toEntity(model)).toList());
      });

  @override
  ResultFuture<GoalEntity> getGoalBySubTaskId(String subTaskId) async =>
      tryCatch<GoalEntity>(() async {
        var entity = await _dataSource.getGoalBySubTaskId(subTaskId);
        return entity.map<GoalEntity>((goal) => toEntity(goal));
      });
}
