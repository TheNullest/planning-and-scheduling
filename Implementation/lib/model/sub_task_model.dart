import 'package:zamaan/data/enums.dart';

class SubTaskModel {
  final int id;
  final int creatorId;
  final int maintTaksId;
  final Importance importance;
  final String subTaskName;
  final String? description;

  /// If the subtask is completed\
  /// and there is no need to repeat it
  final bool isDone;

  SubTaskModel({
    required this.id,
    required this.creatorId,
    required this.maintTaksId,
    required this.subTaskName,
    required this.description,
    required this.importance,
    this.isDone = false,
  });
}
