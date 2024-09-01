import 'package:zamaan/models/task_doing_time_interval_model.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';

class TaskDoingTimeIntervalDTO extends DTOAbstract {
  final DateTime startAt;

  final DateTime? endAt;

  final Duration spentTime;

  TaskDoingTimeIntervalDTO({
    required super.id,
    required this.startAt,
    required this.spentTime,
    this.endAt,
  });

  factory TaskDoingTimeIntervalDTO.fromModel({
    required TaskDoingTimeIntervalModel taskDoingTimeIntervalModel,
  }) =>
      TaskDoingTimeIntervalDTO(
          spentTime:
              Duration(milliseconds: taskDoingTimeIntervalModel.spentTime),
          startAt: taskDoingTimeIntervalModel.startAt,
          endAt: taskDoingTimeIntervalModel.endAt,
          id: taskDoingTimeIntervalModel.id);
}
