import 'package:zamaan/core/usecases/delete_entity_usecase.dart';
import 'package:zamaan/features/task/domain/repositories/goal_repository.dart';

class DeleteGoalUsecase extends DeleteEntityUseCase<GoalRepository> {
  DeleteGoalUsecase(super.repository);
}
