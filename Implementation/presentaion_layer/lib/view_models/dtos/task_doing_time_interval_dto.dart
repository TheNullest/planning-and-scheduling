import 'package:zamaan/models/task_doing_time_interval_model.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';

class TaskDoingTimeIntervalDTO
    extends DTOAbstraction<TaskDoingTimeIntervalModel> {
  final String mainTaskId;

  final String? subTaskId;

  final DateTime startAt;

  final DateTime? endAt;

  final Duration spentTime;

  TaskDoingTimeIntervalDTO({
    required super.id,
    super.creatorId,
    super.description,
    required this.mainTaskId,
    required this.startAt,
    required this.spentTime,
    this.subTaskId,
    this.endAt,
  });

  factory TaskDoingTimeIntervalDTO.fromModel({
    required TaskDoingTimeIntervalModel taskDoingTimeIntervalModel,
  }) =>
      TaskDoingTimeIntervalDTO(
          spentTime:
              Duration(milliseconds: taskDoingTimeIntervalModel.spentTime),
          startAt: taskDoingTimeIntervalModel.startAt,
          creatorId: taskDoingTimeIntervalModel.creatorId,
          description: taskDoingTimeIntervalModel.description,
          endAt: taskDoingTimeIntervalModel.endAt,
          mainTaskId: taskDoingTimeIntervalModel.mainTaskId,
          subTaskId: taskDoingTimeIntervalModel.subTaskId,
          id: taskDoingTimeIntervalModel.id);

  @override
  TaskDoingTimeIntervalModel toModel() => TaskDoingTimeIntervalModel(
      id: id,
      creatorId: creatorId,
      description: description,
      mainTaskId: mainTaskId,
      subTaskId: subTaskId,
      startAt: startAt,
      endAt: endAt,
      spentTime: spentTime.inMilliseconds);
}
