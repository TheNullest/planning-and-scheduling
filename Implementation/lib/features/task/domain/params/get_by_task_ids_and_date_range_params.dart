class GetByTaskIdsAndDateRangeParams {

  GetByTaskIdsAndDateRangeParams(
      {required this.mainTaskIds, this.startAt, this.endAt,});
  final List<String> mainTaskIds;
  final DateTime? startAt;
  final DateTime? endAt;
}
