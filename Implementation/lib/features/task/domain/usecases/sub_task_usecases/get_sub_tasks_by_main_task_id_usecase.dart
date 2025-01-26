import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/sub_task_repository.dart';

class GetSubTasksByMainTaskIdUsecase
    extends UseCaseWithParams<SubTaskRepository, List<SubTaskEntity>, String> {
  GetSubTasksByMainTaskIdUsecase(super.repository);

  @override
  ResultFuture<List<SubTaskEntity>> call(String params) async =>
      repository.getSubTasksByMainTaskId(params);
}
