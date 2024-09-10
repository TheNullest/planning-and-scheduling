import 'package:zamaan/core/entities/base_entity_abstraction.dart';

class SelectedWeekDaysEntity extends BaseEntityAbstraction {
  final List<int> selectedWeekDays;
  final String mainTaskId;
  SelectedWeekDaysEntity({
    super.id,
    required this.mainTaskId,
    super.description,
    required this.selectedWeekDays,
  });
}
