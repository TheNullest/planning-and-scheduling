class GetByTaskIdsAndDateRangeParams {
  final List<String> mainTaskIds;
  final DateTime? startAt;
  final DateTime? endAt;

  GetByTaskIdsAndDateRangeParams(
      {required this.mainTaskIds, this.startAt, this.endAt});
}
