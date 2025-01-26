import 'package:zamaan/core/usecases/update_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class UpdateMainTaskUseCase
    extends UpdateEntityUseCase<MainTaskEntity, MainTaskRepository> {
  UpdateMainTaskUseCase(super.repository);
}
