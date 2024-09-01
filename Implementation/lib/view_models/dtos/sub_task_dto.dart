import 'package:zamaan/models/sub_task_model.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';

class SubTaskDTO extends DTOAbstract {
  final int importance;

  final String subTaskName;

  final String? description;

  /// If the subtask is completed\
  /// and there is no need to repeat it
  final bool isDone;

  SubTaskDTO({
    required super.id,
    required this.subTaskName,
    required this.description,
    required this.importance,
    this.isDone = false,
  });

  factory SubTaskDTO.fromModel({required SubTaskModel subTaskModel}) =>
      SubTaskDTO(
          id: subTaskModel.id,
          subTaskName: subTaskModel.subTaskName,
          description: subTaskModel.description,
          importance: subTaskModel.importance);
}
