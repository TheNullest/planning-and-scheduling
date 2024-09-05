import 'package:data_layer/models/scheduled_task_time_interval_model.dart';
import 'package:data_layer/repositories/hive_scheduled_task_time_interval_repo.dart';
import 'package:domain_layer/dtos/dtos.dart';
import 'package:domain_layer/use_cases/use_case_abstraction.dart';

class ScheduledTaskTimeIntervalUseCase extends UseCaseAbstraction<
    ScheduledTaskTimeIntervalModel,
    HiveScheduledTaskTimeIntervalRepo,
    ScheduledTaskTimeIntervalDTO> {
  @override
  ScheduledTaskTimeIntervalDTO fromModel(
          ScheduledTaskTimeIntervalModel model) =>
      ScheduledTaskTimeIntervalDTO.fromModel(model: model);
}
