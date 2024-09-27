import 'package:zamaan/core/usecases/update_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';
import 'package:zamaan/features/task/domain/repositories/task_scheduler_repository.dart';

class UpdateTaskSchedulerUsecase
    extends UpdateEntityUseCase<TaskSchedulerRepository, TaskSchedulerEntity> {
  UpdateTaskSchedulerUsecase(super.repository);
}
