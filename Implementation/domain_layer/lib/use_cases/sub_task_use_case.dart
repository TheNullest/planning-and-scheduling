import 'package:data_layer/models/models.dart';
import 'package:data_layer/repositories/hive_sub_task_repo.dart';
import 'package:domain_layer/dtos/sub_task_dto.dart';
import 'package:domain_layer/use_cases/use_case_abstraction.dart';

class SubTaskUseCase
    extends UseCaseAbstraction<SubTaskModel, HiveSubTaskRepo, SubTaskDTO> {
  @override
  SubTaskDTO fromModel(SubTaskModel model) =>
      SubTaskDTO.fromModel(model: model);
}
