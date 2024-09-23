import 'package:zamaan/core/usecases/update_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';
import 'package:zamaan/features/task/domain/repositories/goal_repository.dart';

class UpdateGoalUsecase
    extends UpdateEntityUseCase<GoalRepository, GoalEntity> {
  UpdateGoalUsecase(super.repository);
}
