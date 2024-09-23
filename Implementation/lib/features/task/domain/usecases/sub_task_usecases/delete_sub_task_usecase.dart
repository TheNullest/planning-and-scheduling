import 'package:zamaan/core/usecases/delete_entity_usecase.dart';
import 'package:zamaan/features/task/domain/repositories/sub_task_repository.dart';

class DeleteSubTaskUsecase extends DeleteEntityUseCase<SubTaskRepository> {
  DeleteSubTaskUsecase(super.repository);
}
