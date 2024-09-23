import 'package:zamaan/core/usecases/update_entity_usecase.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class UpdateMainTaskUseCase
    extends UpdateEntityUseCase<MainTaskRepository, UserEntity> {
  UpdateMainTaskUseCase(super.repository);
}
