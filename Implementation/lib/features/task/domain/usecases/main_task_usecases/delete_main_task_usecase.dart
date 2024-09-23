import 'package:zamaan/core/usecases/delete_entity_usecase.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class DeleteMainTaskUseCase extends DeleteEntityUseCase<MainTaskRepository> {
  DeleteMainTaskUseCase(super.repository);
}
