import 'package:data_layer/models/scheduled_task_time_interval_model.dart';
import 'package:domain_layer/dtos/dto_abstract.dart';

class ScheduledTaskTimeIntervalDTO
    extends BaseDTOAbstraction<ScheduledTaskTimeIntervalModel> {
  final String mainTaskId;
  final String subTaskId;
  final DateTime startDateTime;

  final DateTime? endDateTime;

  final bool completed;

  ScheduledTaskTimeIntervalDTO({
    required super.id,
    required this.startDateTime,
    required this.mainTaskId,
    required this.subTaskId,
    this.endDateTime,
    this.completed = false,
  });

  factory ScheduledTaskTimeIntervalDTO.fromModel(
          {required ScheduledTaskTimeIntervalModel model}) =>
      ScheduledTaskTimeIntervalDTO(
          id: model.id,
          mainTaskId: model.mainTaskId,
          subTaskId: model.subTaskId,
          startDateTime: model.startDateTime,
          endDateTime: model.endDateTime,
          completed: model.completed);

  @override
  ScheduledTaskTimeIntervalModel toModel() => ScheduledTaskTimeIntervalModel(
        id: id,
        mainTaskId: mainTaskId,
        subTaskId: subTaskId,
        startDateTime: startDateTime,
        completed: completed,
        creatorId: creatorId,
        description: description,
        endDateTime: endDateTime,
      );
}
