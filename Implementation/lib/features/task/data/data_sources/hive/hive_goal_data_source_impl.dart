import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/base_local_data_source_abstraction.dart';
import 'package:zamaan/core/services/hive_services.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/data/data_sources/bases/goal_data_source.dart';
import 'package:zamaan/features/task/data/models/local/goal_local_model.dart';
import 'package:zamaan/features/task/data/models/local/local_models.dart';

class HiveGoalDataSourceImpl
    extends BaseLocalDataSourceAbstraction<GoalLocalModel>
    implements GoalDataSource<GoalLocalModel> {
  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<MainTaskLocalModel>] like this
  HiveGoalDataSourceImpl({HiveServices<GoalLocalModel>? hiveBox})
      : _hiveBox = hiveBox ?? HiveServices<GoalLocalModel>(),
        super(hiveBox: hiveBox, HiveBoxConstants.GOALS_BOX);
  final String _boxName = HiveBoxConstants.GOALS_BOX;
  final HiveServices<GoalLocalModel> _hiveBox;

  @override
  ResultFuture<List<GoalLocalModel>> getGoalsByMainTaskId(
    String mainTaskId,
  ) async =>
      _hiveBox.operator<List<GoalLocalModel>>(
        job: (box) async => box.values
            .where((goalModel) => goalModel.mainTaskId == mainTaskId)
            .toList(),
        boxName: _boxName,
      );

  @override
  ResultFuture<GoalLocalModel> getGoalBySubTaskId(String subTaskId) async =>
      _hiveBox.operator<GoalLocalModel>(
        job: (box) async => box.values
            .firstWhere((goalModel) => goalModel.subTaskId == subTaskId),
        boxName: _boxName,
      );
}
