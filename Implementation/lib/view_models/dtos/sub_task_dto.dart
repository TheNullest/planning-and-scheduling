import 'package:zamaan/models/sub_task_model.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';

class SubTaskDTO extends DTOAbstraction<SubTaskModel> {
  final String mainTaskId;
  final int priority;

  final String title;

  /// If the subtask is completed\
  /// and there is no need to repeat it
  final bool completed;

  SubTaskDTO({
    required super.id,
    required super.creatorId,
    required this.mainTaskId,
    required this.title,
    super.description,
    required this.priority,
    this.completed = false,
  });

  factory SubTaskDTO.fromModel({required SubTaskModel subTaskModel}) =>
      SubTaskDTO(
        id: subTaskModel.id,
        creatorId: subTaskModel.creatorId,
        mainTaskId: subTaskModel.mainTaskId,
        title: subTaskModel.title,
        description: subTaskModel.description,
        priority: subTaskModel.priority,
      );

  @override
  SubTaskModel toModel() => SubTaskModel(
        id: id,
        mainTaskId: mainTaskId,
        title: title,
        priority: priority,
        completed: completed,
        creatorId: creatorId,
        description: description,
      );
}
