import 'package:hive/hive.dart';
import 'package:zamaan/models/bases/base_type_adapter_asbtract.dart';
import 'package:zamaan/models/models.dart';

part 'goal_model.g.dart';

@HiveType(typeId: 8)
class GoalModel extends BaseModelAbstract {
  @HiveField(5)
  final String mainTaskId;

  /// The minimum amount of time allocated in seconds for the desired task or program each day
  @HiveField(1)
  final int? perDay;

  /// The minimum amount of time allocated in seconds for the desired task or program each week
  @HiveField(2)
  final int? perWeek;

  /// The minimum amount of time allocated in seconds for the desired task or program each month
  @HiveField(3)
  final int? perMonth;

  /// The minimum amount of time allocated in seconds for the desired task or program each year
  @HiveField(4)
  final int? perYear;

  GoalModel({
    required super.id,
    required this.mainTaskId,
    this.perDay,
    this.perWeek,
    this.perMonth,
    this.perYear,
  });
}
