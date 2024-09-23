import 'package:zamaan/core/usecases/get_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';
import 'package:zamaan/features/task/domain/repositories/goal_repository.dart';

class GetGoalUsecase extends GetEntityUseCase<GoalRepository, GoalEntity> {
  GetGoalUsecase(super.repository);
}
