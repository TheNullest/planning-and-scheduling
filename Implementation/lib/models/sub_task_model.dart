import 'package:hive/hive.dart';
import 'package:zamaan/models/bases/base_model_abstract.dart';
import 'package:zamaan/models/bases/base_type_adapter_asbtract.dart';

part 'sub_task_model.g.dart';

@HiveType(typeId: 6)
class SubTaskModel extends BaseModelAbstract {
  @HiveField(1)
  final String creatorId;

  @HiveField(2)
  final String maintTaskId;

  @HiveField(3)
  final int importance;

  @HiveField(4)
  final String subTaskName;

  @HiveField(5)
  final String? description;

  /// If the subtask is completed\
  /// and there is no need to repeat it
  @HiveField(6)
  final bool isDone;

  SubTaskModel({
    required super.id,
    required this.creatorId,
    required this.maintTaskId,
    required this.subTaskName,
    required this.description,
    required this.importance,
    this.isDone = false,
  });
}
