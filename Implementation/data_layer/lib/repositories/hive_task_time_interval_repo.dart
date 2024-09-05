import 'package:data_layer/models/models.dart';
import 'package:data_layer/repositories/hive_base_repository_abstraction.dart';
import 'package:hive/hive.dart';

class HiveTaskTimeIntervalRepo
    extends HiveBaseRepositoryAbstraction<TaskTimeIntervalModel> {
  static const String _boxName = 'taskTimeIntervalsBox';

  @override
  String get boxName => _boxName;

  @override
  TypeAdapter<TaskTimeIntervalModel> get modelAdapter =>
      TaskTimeIntervalModelAdapter();
}
