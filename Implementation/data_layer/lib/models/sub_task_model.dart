import 'package:hive/hive.dart';
import 'package:zamaan/models/bases/base_model_abstract.dart';
import 'package:zamaan/models/bases/base_type_adapter_asbtract.dart';

part 'sub_task_model.g.dart';

@HiveType(typeId: 6)
class SubTaskModel extends BaseModelAbstraction {
  @HiveField(3)
  final String mainTaskId;

  @HiveField(4)
  final int priority;

  @HiveField(5)
  final String title;

  /// If the subtask is completed\
  /// and there is no need to repeat it
  @HiveField(6)
  final bool completed;

  SubTaskModel({
    required super.id,
    super.creatorId,
    required this.mainTaskId,
    required this.title,
    super.description,
    required this.priority,
    this.completed = false,
  });
}
