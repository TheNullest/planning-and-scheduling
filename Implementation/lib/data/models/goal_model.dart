import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:zamaan/data/models.dart';

part 'goal_model.g.dart';

@HiveType(typeId: 8)
class GoalModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final MainTaskModel mainTaskModel;

  @HiveField(2)
  final SubTaskModel? subTaskModel;

  @HiveField(3)
  final Duration daily;

  @HiveField(4)
  final Duration weekly;

  @HiveField(5)
  final Duration monthly;

  @HiveField(6)
  final Duration yearly;

  @HiveField(7)
  final bool custom;

  GoalModel({
    required this.id,
    required this.mainTaskModel,
    this.subTaskModel,
    this.custom = true,
    this.daily = const Duration(hours: 24),
    this.weekly = const Duration(hours: 168),
    this.monthly = const Duration(hours: 720),
    this.yearly = const Duration(hours: 8760),
  });

  GoalModel.create({
    required this.mainTaskModel,
    this.subTaskModel,
    this.custom = true,
    this.daily = const Duration(hours: 24),
    this.weekly = const Duration(hours: 168),
    this.monthly = const Duration(hours: 720),
    this.yearly = const Duration(hours: 8760),
  }) : id = const Uuid().v4();
}
