import 'package:data_layer/models/task_time_interval_model.dart';
import 'package:domain_layer/dtos/dto_abstract.dart';

class TaskTimeIntervalDTO extends BaseDTOAbstraction<TaskTimeIntervalModel> {
  final String mainTaskId;

  final String? subTaskId;

  final DateTime startAt;

  final DateTime? endAt;

  final Duration spentTime;

  TaskTimeIntervalDTO({
    required super.id,
    super.creatorId,
    super.description,
    required this.mainTaskId,
    required this.startAt,
    required this.spentTime,
    this.subTaskId,
    this.endAt,
  });

  factory TaskTimeIntervalDTO.fromModel({
    required TaskTimeIntervalModel model,
  }) =>
      TaskTimeIntervalDTO(
          spentTime: Duration(milliseconds: model.spentTime),
          startAt: model.startAt,
          creatorId: model.creatorId,
          description: model.description,
          endAt: model.endAt,
          mainTaskId: model.mainTaskId,
          subTaskId: model.subTaskId,
          id: model.id);

  @override
  TaskTimeIntervalModel toModel() => TaskTimeIntervalModel(
      id: id,
      creatorId: creatorId,
      description: description,
      mainTaskId: mainTaskId,
      subTaskId: subTaskId,
      startAt: startAt,
      endAt: endAt,
      spentTime: spentTime.inMilliseconds);
}
