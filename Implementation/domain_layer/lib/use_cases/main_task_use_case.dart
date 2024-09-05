import 'package:data_layer/models/main_task_model.dart';
import 'package:data_layer/repositories/hive_main_task_repo.dart';
import 'package:domain_layer/dtos/main_task_dto.dart';
import 'package:domain_layer/use_cases/use_case_abstraction.dart';

class MainTaskUseCase
    extends UseCaseAbstraction<MainTaskModel, HiveMainTaskRepo, MainTaskDTO> {
  @override
  MainTaskDTO fromModel(MainTaskModel model) =>
      MainTaskDTO.fromModel(model: model);
}
