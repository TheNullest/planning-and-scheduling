import 'package:data_layer/models/goal_model.dart';
import 'package:data_layer/repositories/hive_base_repository_abstraction.dart';
import 'package:hive/hive.dart';

class HiveGoalRepo extends HiveBaseRepositoryAbstraction<GoalModel> {
  static const String _boxName = 'goalsBox';

  @override
  String get boxName => _boxName;

  @override
  TypeAdapter<GoalModel> get modelAdapter => GoalModelAdapter();
}
