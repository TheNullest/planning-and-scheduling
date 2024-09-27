import 'package:zamaan/core/usecases/delete_entity_usecase.dart';
import 'package:zamaan/features/task/domain/repositories/task_scheduler_repository.dart';

class DeleteTaskSchedulerUsecase
    extends DeleteEntityUseCase<TaskSchedulerRepository> {
  DeleteTaskSchedulerUsecase(super.repository);
}
