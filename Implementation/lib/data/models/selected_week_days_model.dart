import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:zamaan/data/models.dart';
import 'package:zamaan/utilities/enums.dart';

part 'selected_week_days_model.g.dart';

@HiveType(typeId: 4)
class SelectedWeekDaysModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final MainTaskModel mainTask;

  @HiveField(2)
  final List<WeekDays> selectedWeekDays;

  SelectedWeekDaysModel.create({
    required this.mainTask,
    required this.selectedWeekDays,
  }) : id = const Uuid().v4();

  SelectedWeekDaysModel({
    required this.id,
    required this.mainTask,
    required this.selectedWeekDays,
  });
}
