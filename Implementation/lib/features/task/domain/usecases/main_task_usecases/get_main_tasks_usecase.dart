import 'package:zamaan/core/usecases/get_entities_usecase.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class GetMainTasksUsecase
    extends getEntitiesUseCase<MainTaskRepository, MainTaskEntity> {
  GetMainTasksUsecase(super.repository);
}
