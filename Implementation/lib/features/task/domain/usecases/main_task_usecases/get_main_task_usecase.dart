import 'package:zamaan/core/usecases/get_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class GetMainTaskUsecase
    extends GetEntityUseCase<MainTaskRepository, MainTaskEntity> {
  GetMainTaskUsecase(super.repository);
}
