import 'package:data_layer/models/goal_model.dart';
import 'package:data_layer/repositories/hive_goal_repo.dart';
import 'package:domain_layer/dtos/goal_dto.dart';
import 'package:domain_layer/use_cases/use_case_abstraction.dart';

class GoalUseCase extends UseCaseAbstraction<GoalModel, HiveGoalRepo, GoalDTO> {
  @override
  GoalDTO fromModel(GoalModel model) => GoalDTO.fromModel(model: model);
}
