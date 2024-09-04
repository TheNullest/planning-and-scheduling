import 'package:hive/hive.dart';
import 'package:zamaan/models/bases/base_type_adapter_asbtract.dart';
import 'package:zamaan/models/models.dart';

part 'selected_week_days_model.g.dart';

@HiveType(typeId: 4)
class SelectedWeekDaysModel extends BaseModelAbstraction {
  @HiveField(4)
  final String mainTaskId;

  @HiveField(3)
  final List<int> selectedWeekDays;

  SelectedWeekDaysModel({
    required super.id,
    super.creatorId,
    super.description,
    required this.mainTaskId,
    required this.selectedWeekDays,
  });
}
