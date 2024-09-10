import 'package:zamaan/core/entities/base_entity_abstraction.dart';

class SubTaskEntity extends BaseEntityAbstraction {
  final String mainTaskId;
  final int priority;

  final String title;

  /// If the subtask is completed\
  /// and there is no need to repeat it
  final bool completed;

  SubTaskEntity({
    super.id,
    required super.creatorId,
    required this.mainTaskId,
    required this.title,
    super.description,
    required this.priority,
    this.completed = false,
  });
}
