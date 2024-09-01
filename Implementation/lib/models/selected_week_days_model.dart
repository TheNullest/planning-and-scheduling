import 'package:hive/hive.dart';
import 'package:zamaan/models/bases/base_type_adapter_asbtract.dart';
import 'package:zamaan/models/models.dart';

part 'selected_week_days_model.g.dart';

@HiveType(typeId: 4)
class SelectedWeekDaysModel extends BaseModelAbstract {
  @HiveField(1)
  final String mainTaskId;

  @HiveField(2)
  final List<int> selectedWeekDays;

  SelectedWeekDaysModel({
    required super.id,
    required this.mainTaskId,
    required this.selectedWeekDays,
  });
}
