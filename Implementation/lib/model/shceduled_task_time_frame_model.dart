class ScheduledTaskTimeFrame {
  final int id;
  final int userId;
  final int mainTaskId;

  /// subTaskId = mainTaskId\
  /// If the main task has no sub-tasks,\
  /// enter the value of the subTaskId as the value of the mainTaskId
  final int subTaskId;
  final DateTime startDateTime;
  final DateTime? endDateTime;
  final bool isDone;

  ScheduledTaskTimeFrame({
    required this.id,
    required this.userId,
    required this.mainTaskId,
    required this.subTaskId,
    required this.startDateTime,
    this.endDateTime,
    this.isDone = false,
  });
}
