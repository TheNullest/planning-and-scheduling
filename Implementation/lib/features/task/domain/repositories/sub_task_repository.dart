import 'package:zamaan/core/enums/enums.dart';
import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';

abstract interface class SubTaskRepository
    extends BaseRepositoryAbstraction<SubTaskEntity> {
  ResultFuture<List<SubTaskEntity>> getSubTasksByMainTaskId(String mainTaskId);
  ResultFuture<List<SubTaskEntity>> getSubTasksByStatus(Status status);
  ResultFuture<List<SubTaskEntity>> getSubTasksByPriority(Priority priority);
}
