import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';

abstract interface class GoalRepository
    extends BaseRepositoryAbstraction<GoalEntity> {
  ResultFuture<List<GoalEntity>> getGoalsByMainTaskId(String mainTaskId);
  ResultFuture<GoalEntity> getGoalBySubTaskId(String subTaskId);
}
