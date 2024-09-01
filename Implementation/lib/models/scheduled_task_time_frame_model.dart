import 'package:hive/hive.dart';
import 'package:zamaan/models/bases/base_type_adapter_asbtract.dart';
import 'package:zamaan/models/models.dart';

part 'scheduled_task_time_frame_model.g.dart';

@HiveType(typeId: 5)
class ScheduledTaskTimeIntervalModel extends BaseModelAbstract {
  @HiveField(1)
  final String creatorId;

  @HiveField(2)
  final String mainTaskId;

  /// subTaskId = mainTaskId\
  /// If the main task has no sub-tasks,\
  /// enter the value of the subTaskId as the value of the mainTaskId
  @HiveField(3)
  final String subTask;

  @HiveField(4)
  final DateTime startDateTime;

  @HiveField(5)
  final DateTime? endDateTime;

  @HiveField(6)
  final bool isDone;

  ScheduledTaskTimeIntervalModel({
    required super.id,
    required this.creatorId,
    required this.mainTaskId,
    required this.subTask,
    required this.startDateTime,
    this.endDateTime,
    this.isDone = false,
  });
}
