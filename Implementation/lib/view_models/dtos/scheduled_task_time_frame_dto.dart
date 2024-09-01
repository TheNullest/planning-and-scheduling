import 'package:zamaan/models/scheduled_task_time_frame_model.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';

class ScheduledTaskTimeIntervalDTO extends DTOAbstract {
  final DateTime startDateTime;

  final DateTime? endDateTime;

  final bool isDone;

  ScheduledTaskTimeIntervalDTO({
    required super.id,
    required this.startDateTime,
    this.endDateTime,
    this.isDone = false,
  });

  factory ScheduledTaskTimeIntervalDTO.fromModel(
          {required ScheduledTaskTimeIntervalModel
              scheduledTaskTimeIntervalModel}) =>
      ScheduledTaskTimeIntervalDTO(
          id: scheduledTaskTimeIntervalModel.id,
          startDateTime: scheduledTaskTimeIntervalModel.startDateTime,
          endDateTime: scheduledTaskTimeIntervalModel.endDateTime,
          isDone: scheduledTaskTimeIntervalModel.isDone);
}
