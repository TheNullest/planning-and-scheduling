import 'package:zamaan/core/usecases/get_entities_usecase.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';
import 'package:zamaan/features/task/domain/repositories/goal_repository.dart';

class GetGoalsUsecase extends GetEntitiesUseCase<GoalRepository, GoalEntity> {
  GetGoalsUsecase(super.repository);
}
