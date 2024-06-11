class TaskDoingTimeFrameModel {
  final int id;
  final int userId;
  final int mainTaskId;
  final int? subTaskId;
  final DateTime startAt;
  final DateTime? endAt;

  TaskDoingTimeFrameModel(
      {required this.id,
      required this.userId,
      required this.mainTaskId,
      required this.subTaskId,
      required this.startAt,
      required this.endAt});
}
