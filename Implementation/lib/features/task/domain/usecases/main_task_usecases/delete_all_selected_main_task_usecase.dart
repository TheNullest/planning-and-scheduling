import 'package:zamaan/core/usecases/delete_entities_usecase.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class DeleteAllSelectedMainTasksUsecase
    extends DeleteEntitiesUseCase<MainTaskRepository> {
  DeleteAllSelectedMainTasksUsecase(super.repository);
}
