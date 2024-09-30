import 'package:zamaan/core/utils/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/hive_base_data_source_abstraction.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/core/utils/enums/priority_enum.dart';
import 'package:zamaan/core/utils/enums/status_enum.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/data/models/local/hive_sub_task_model.dart';

class HiveSubTaskDataSourceImpl
    extends HiveBaseDataSourceAbstraction<HiveSubTaskModel> {
  final String _boxName = HiveBoxConstants.SUB_TASKS_BOX;
  final HiveInitializer<HiveSubTaskModel> _hiveBox;

  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<HiveSubTaskModel>] like this
  HiveSubTaskDataSourceImpl({HiveInitializer<HiveSubTaskModel>? hiveBox})
      : _hiveBox = hiveBox ?? HiveInitializer<HiveSubTaskModel>(),
        super(hiveBox: hiveBox, HiveBoxConstants.SUB_TASKS_BOX);

  ResultFuture<List<HiveSubTaskModel>> getSubTasksByPriority(
          Priority priority) async =>
      await _hiveBox.operator<List<HiveSubTaskModel>>(
        job: (box) async => box.values
            .where((item) => item.priority == (priority.index))
            .toList(),
        boxName: _boxName,
      );

  ResultFuture<List<HiveSubTaskModel>> getSubTasksByStatus(
          Status status) async =>
      await _hiveBox.operator<List<HiveSubTaskModel>>(
        job: (box) async =>
            box.values.where((item) => item.status == (status.index)).toList(),
        boxName: _boxName,
      );

  ResultFuture<List<HiveSubTaskModel>> getSubTasksByMainTaskId(
          String mainTaskId) async =>
      await _hiveBox.operator<List<HiveSubTaskModel>>(
        job: (box) async =>
            box.values.where((item) => item.mainTaskId == mainTaskId).toList(),
        boxName: _boxName,
      );
}
