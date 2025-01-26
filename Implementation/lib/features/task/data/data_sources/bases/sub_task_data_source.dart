import 'package:zamaan/core/data_sources/base_data_source_abstraction.dart';
import 'package:zamaan/core/enums/priority_enum.dart';
import 'package:zamaan/core/enums/status_enum.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';

abstract class SubTaskDataSource<SubTaskModel extends SubTaskEntity>
    extends BaseDataSourceAbstraction<SubTaskModel> {
  ResultFuture<List<SubTaskModel>> getSubTasksByPriority(
    Priority priority,
  );

  ResultFuture<List<SubTaskModel>> getSubTasksByStatus(
    Status status,
  );

  ResultFuture<List<SubTaskModel>> getSubTasksByMainTaskId(
    String mainTaskId,
  );
}
