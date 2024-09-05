import 'package:data_layer/models/models.dart';
import 'package:data_layer/repositories/hive_base_repository_abstraction.dart';
import 'package:hive/hive.dart';

class HiveSelectedWeekDaysRepo
    extends HiveBaseRepositoryAbstraction<SelectedWeekDaysModel> {
  static const String _boxName = 'selectedWeekDaysBox';

  @override
  String get boxName => _boxName;

  @override
  TypeAdapter<SelectedWeekDaysModel> get modelAdapter =>
      SelectedWeekDaysModelAdapter();
}
