import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:zamaan/data/models.dart';

part 'scheduled_task_time_frame_model.g.dart';

@HiveType(typeId: 5)
class ScheduledTaskTimeFrame extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final UserModel creator;

  @HiveField(2)
  final MainTaskModel mainTask;

  /// subTaskId = mainTaskId\
  /// If the main task has no sub-tasks,\
  /// enter the value of the subTaskId as the value of the mainTaskId
  @HiveField(3)
  final SubTaskModel subTask;

  @HiveField(4)
  final DateTime startDateTime;

  @HiveField(5)
  final DateTime? endDateTime;

  @HiveField(6)
  final bool isDone;

  ScheduledTaskTimeFrame.create({
    required this.creator,
    required this.mainTask,
    required this.subTask,
    required this.startDateTime,
    this.endDateTime,
    this.isDone = false,
  }) : id = const Uuid().v4();

  ScheduledTaskTimeFrame({
    required this.id,
    required this.creator,
    required this.mainTask,
    required this.subTask,
    required this.startDateTime,
    this.endDateTime,
    this.isDone = false,
  });
}
