import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/base_local_data_source_abstraction.dart';
import 'package:zamaan/core/enums/priority_enum.dart';
import 'package:zamaan/core/enums/status_enum.dart';
import 'package:zamaan/core/services/hive_services.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/data/data_sources/bases/sub_task_data_source.dart';
import 'package:zamaan/features/task/data/models/local/local_models.dart';

class HiveSubTaskDataSourceImpl
    extends BaseLocalDataSourceAbstraction<SubTaskLocalModel>
    implements SubTaskDataSource<SubTaskLocalModel> {
  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<SubTaskLocalModel>] like this
  HiveSubTaskDataSourceImpl({HiveServices<SubTaskLocalModel>? hiveBox})
      : _hiveBox = hiveBox ?? HiveServices<SubTaskLocalModel>(),
        super(hiveBox: hiveBox, HiveBoxConstants.SUB_TASKS_BOX);
  final String _boxName = HiveBoxConstants.SUB_TASKS_BOX;
  final HiveServices<SubTaskLocalModel> _hiveBox;

  @override
  ResultFuture<List<SubTaskLocalModel>> getSubTasksByPriority(
    Priority priority,
  ) async =>
      _hiveBox.operator<List<SubTaskLocalModel>>(
        job: (box) async => box.values
            .where((item) => item.priority == (priority.index))
            .toList(),
        boxName: _boxName,
      );

  @override
  ResultFuture<List<SubTaskLocalModel>> getSubTasksByStatus(
    Status status,
  ) async =>
      _hiveBox.operator<List<SubTaskLocalModel>>(
        job: (box) async =>
            box.values.where((item) => item.status == (status.index)).toList(),
        boxName: _boxName,
      );

  @override
  ResultFuture<List<SubTaskLocalModel>> getSubTasksByMainTaskId(
    String mainTaskId,
  ) async =>
      _hiveBox.operator<List<SubTaskLocalModel>>(
        job: (box) async =>
            box.values.where((item) => item.mainTaskId == mainTaskId).toList(),
        boxName: _boxName,
      );
}
