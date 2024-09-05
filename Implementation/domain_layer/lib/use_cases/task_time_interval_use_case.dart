import 'package:data_layer/models/task_time_interval_model.dart';
import 'package:data_layer/repositories/hive_task_time_interval_repo.dart';
import 'package:domain_layer/dtos/task_time_interval_dto.dart';
import 'package:domain_layer/use_cases/use_case_abstraction.dart';

class TaskTimeIntervalUseCase extends UseCaseAbstraction<TaskTimeIntervalModel,
    HiveTaskTimeIntervalRepo, TaskTimeIntervalDTO> {
  @override
  TaskTimeIntervalDTO fromModel(TaskTimeIntervalModel model) =>
      TaskTimeIntervalDTO.fromModel(model: model);
}
