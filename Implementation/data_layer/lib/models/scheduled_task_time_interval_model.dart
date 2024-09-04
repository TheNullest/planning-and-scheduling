import 'package:hive/hive.dart';
import 'package:zamaan/models/bases/base_type_adapter_asbtract.dart';
import 'package:zamaan/models/models.dart';

part 'scheduled_task_time_interval_model.g.dart';

@HiveType(typeId: 5)
class ScheduledTaskTimeIntervalModel extends BaseModelAbstraction {
  @HiveField(2)
  final String mainTaskId;

  /// subTaskId = mainTaskId\
  /// If the main task has no sub-tasks,\
  /// put the value of the subTaskId as the value of the mainTaskId
  @HiveField(3)
  final String subTaskId;

  @HiveField(4)
  final DateTime startDateTime;

  @HiveField(5)
  final DateTime? endDateTime;

  @HiveField(6)
  final bool completed;

  ScheduledTaskTimeIntervalModel({
    required super.id,
    super.creatorId,
    super.description,
    required this.mainTaskId,
    required this.subTaskId,
    required this.startDateTime,
    this.endDateTime,
    this.completed = false,
  });
}
