import 'package:data_layer/models/models.dart';
import 'package:data_layer/repositories/hive_base_repository_abstraction.dart';
import 'package:hive/hive.dart';

class HiveScheduledTaskTimeIntervalRepo
    extends HiveBaseRepositoryAbstraction<ScheduledTaskTimeIntervalModel> {
  static const String _boxName = 'scheduledTaskTimeIntervalsBox';

  @override
  String get boxName => _boxName;

  @override
  TypeAdapter<ScheduledTaskTimeIntervalModel> get modelAdapter =>
      ScheduledTaskTimeIntervalModelAdapter();
}
