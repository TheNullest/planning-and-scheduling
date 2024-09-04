import 'package:zamaan/models/scheduled_task_time_interval_model.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';

class ScheduledTaskTimeIntervalDTO
    extends DTOAbstraction<ScheduledTaskTimeIntervalModel> {
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
          {required ScheduledTaskTimeIntervalModel
              scheduledTaskTimeIntervalModel}) =>
      ScheduledTaskTimeIntervalDTO(
          id: scheduledTaskTimeIntervalModel.id,
          mainTaskId: scheduledTaskTimeIntervalModel.mainTaskId,
          subTaskId: scheduledTaskTimeIntervalModel.subTaskId,
          startDateTime: scheduledTaskTimeIntervalModel.startDateTime,
          endDateTime: scheduledTaskTimeIntervalModel.endDateTime,
          completed: scheduledTaskTimeIntervalModel.completed);

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
