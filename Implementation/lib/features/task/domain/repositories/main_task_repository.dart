import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/utils/enums/enums.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';

abstract class MainTaskRepository
    extends BaseRepositoryAbstraction<MainTaskEntity> {
  ResultFuture<List<MainTaskEntity>> getMainTasksByStatus(Status status);
  ResultFuture<List<MainTaskEntity>> getMainTasksByPriority(Priority priority);
  ResultFuture<List<MainTaskEntity>> getMainTasksByDueDate(DateTime dueDate);
  ResultFuture<List<MainTaskEntity>> getMainTasksByCategories(
      List<String> categoryIds);
  ResultFuture<List<MainTaskEntity>> getMainTasksByTags(List<String> tagIds);
  ResultFuture<MainTaskEntity> getMainTaskByTaskScheduler(String schedulerId);
}
