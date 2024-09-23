import 'package:zamaan/core/usecases/get_entities_usecase.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class GetMainTasksUsecase
    extends GetEntitiesUseCase<MainTaskRepository, UserEntity> {
  GetMainTasksUsecase(super.repository);
}
