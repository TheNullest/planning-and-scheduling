import 'package:zamaan/core/usecases/create_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';
import 'package:zamaan/features/task/domain/repositories/goal_repository.dart';

class CreateGoalUsecase
    extends CreateEntityUseCase<GoalRepository, GoalEntity> {
  CreateGoalUsecase(super.repository);
}
