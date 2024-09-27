import 'package:zamaan/core/usecases/create_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';
import 'package:zamaan/features/task/domain/repositories/task_scheduler_repository.dart';

class CreateTaskSchedulerUsecase
    extends CreateEntityUseCase<TaskSchedulerRepository, TaskSchedulerEntity> {
  CreateTaskSchedulerUsecase(super.repository);
}
