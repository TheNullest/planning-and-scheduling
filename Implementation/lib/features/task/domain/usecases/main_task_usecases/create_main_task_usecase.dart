import 'package:zamaan/core/usecases/create_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class CreateMainTaskUseCase
    extends CreateEntityUseCase<MainTaskRepository, MainTaskEntity> {
  CreateMainTaskUseCase(super.repository);
}
