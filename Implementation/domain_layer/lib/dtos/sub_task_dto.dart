import 'package:data_layer/models/sub_task_model.dart';
import 'package:domain_layer/dtos/dto_abstract.dart';

class SubTaskDTO extends BaseDTOAbstraction<SubTaskModel> {
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

  factory SubTaskDTO.fromModel({required SubTaskModel model}) => SubTaskDTO(
        id: model.id,
        creatorId: model.creatorId,
        mainTaskId: model.mainTaskId,
        title: model.title,
        description: model.description,
        priority: model.priority,
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
