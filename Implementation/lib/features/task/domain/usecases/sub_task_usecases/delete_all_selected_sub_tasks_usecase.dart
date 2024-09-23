import 'package:zamaan/core/usecases/delete_entities_usecase.dart';
import 'package:zamaan/features/task/domain/repositories/sub_task_repository.dart';

class DeleteAllSelectedSubTasksUsecase
    extends DeleteEntitiesUseCase<SubTaskRepository> {
  DeleteAllSelectedSubTasksUsecase(super.repository);
}
