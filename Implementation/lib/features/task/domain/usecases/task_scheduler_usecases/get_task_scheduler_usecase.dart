import 'package:zamaan/core/usecases/get_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';
import 'package:zamaan/features/task/domain/repositories/task_scheduler_repository.dart';

class GetTaskSchedulerUsecase
    extends GetEntityUseCase<TaskSchedulerRepository, TaskSchedulerEntity> {
  GetTaskSchedulerUsecase(super.repository);
}
