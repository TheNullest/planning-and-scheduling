import 'package:zamaan/core/utils/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/hive_base_data_source_abstraction.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/core/utils/enums/enums.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/data/models/local/hive_main_task_model.dart';

class HiveMainTaskDataSourceImpl
    extends HiveBaseDataSourceAbstraction<HiveMainTaskModel> {
  final String _boxName = HiveBoxConstants.MAINTASKS_BOX;
  final HiveInitializer<HiveMainTaskModel> _hiveBox;

  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<HiveMainTaskModel>] like this
  HiveMainTaskDataSourceImpl({HiveInitializer<HiveMainTaskModel>? hiveBox})
      : _hiveBox = hiveBox ?? HiveInitializer<HiveMainTaskModel>(),
        super(hiveBox: hiveBox, HiveBoxConstants.MAINTASKS_BOX);

  ResultFuture<List<HiveMainTaskModel>> getMainTasksByCategories(
          List<String> categoryIds) async =>
      await _hiveBox.operator<List<HiveMainTaskModel>>(
        job: (box) async => box.values
            .where((item) => item.categoryIds!
                .any((categoryId) => categoryIds.contains(categoryId)))
            .toList(),
        boxName: _boxName,
      );

  ResultFuture<List<HiveMainTaskModel>> getMainTasksByDueDate(
          DateTime dueDate) async =>
      await _hiveBox.operator<List<HiveMainTaskModel>>(
        job: (box) async => box.values
            .where((item) => item.dueDate!.compareTo(dueDate) <= 0)
            .toList(),
        boxName: _boxName,
      );

  ResultFuture<List<HiveMainTaskModel>> getMainTasksByPriority(
          Priority priority) async =>
      await _hiveBox.operator<List<HiveMainTaskModel>>(
        job: (box) async => box.values
            .where((item) => item.priority == (priority.index))
            .toList(),
        boxName: _boxName,
      );

  ResultFuture<List<HiveMainTaskModel>> getMainTasksByStatus(
          Status status) async =>
      await _hiveBox.operator<List<HiveMainTaskModel>>(
        job: (box) async =>
            box.values.where((item) => item.status == (status.index)).toList(),
        boxName: _boxName,
      );
  ResultFuture<List<HiveMainTaskModel>> getMainTasksByTags(
          List<String> tagIds) async =>
      await _hiveBox.operator<List<HiveMainTaskModel>>(
        job: (box) async => box.values
            .where(
                (task) => task.tagIds!.any((tagId) => tagIds.contains(tagId)))
            .toList(),
        boxName: _boxName,
      );

  ResultFuture<HiveMainTaskModel> getMainTaskByTaskSchedulerId(
          String schedulerId) async =>
      await _hiveBox.operator<HiveMainTaskModel>(
        job: (box) async => box.values
            .firstWhere((item) => item.taskSchedulerId == schedulerId),
        boxName: _boxName,
      );
}
