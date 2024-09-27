import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/hive_base_data_source_abstraction.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/data/models/local/hive_goal_model.dart';

class HiveGoalDataSourceImpl
    extends HiveBaseDataSourceAbstraction<HiveGoalModel> {
  final String _boxName = HiveBoxConstants.GOALS_BOX;
  final HiveInitializer<HiveGoalModel> _hiveBox;

  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<HiveMainTaskModel>] like this
  HiveGoalDataSourceImpl({HiveInitializer<HiveGoalModel>? hiveBox})
      : _hiveBox = hiveBox ?? HiveInitializer<HiveGoalModel>(),
        super(hiveBox: hiveBox, HiveBoxConstants.GOALS_BOX);

  ResultFuture<List<HiveGoalModel>> getGoalsByMainTaskId(
          String mainTaskId) async =>
      await _hiveBox.operator<List<HiveGoalModel>>(
          job: (box) async => box.values
              .where((goalModel) => goalModel.mainTaskId == mainTaskId)
              .toList(),
          boxName: _boxName);

  ResultFuture<HiveGoalModel> getGoalBySubTaskId(String subTaskId) async =>
      await _hiveBox.operator<HiveGoalModel>(
          job: (box) async => box.values
              .firstWhere((goalModel) => goalModel.subTaskId == subTaskId),
          boxName: _boxName);
}
