import 'package:zamaan/core/data_sources/base_data_source_abstraction.dart';
import 'package:zamaan/core/enums/enums.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';

abstract class MainTaskDataSource<MainTaskModel extends MainTaskEntity>
    extends BaseDataSourceAbstraction<MainTaskModel> {
  ResultFuture<List<MainTaskModel>> getMainTasksByCategories(
    List<String> categoryIds,
  );
  ResultFuture<List<MainTaskModel>> getMainTasksByDueDate(DateTime dueDate);
  ResultFuture<List<MainTaskModel>> getMainTasksByPriority(Priority priority);
  ResultFuture<List<MainTaskModel>> getMainTasksByStatus(Status status);
  ResultFuture<List<MainTaskModel>> getMainTasksByTags(List<String> tagIds);
  ResultFuture<MainTaskModel> getMainTaskByTaskSchedulerId(String schedulerId);
}
