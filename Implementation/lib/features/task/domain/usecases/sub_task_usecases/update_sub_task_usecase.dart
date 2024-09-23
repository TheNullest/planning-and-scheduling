import 'package:zamaan/core/usecases/update_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/sub_task_repository.dart';

class UpdateSubTaskUsecase
    extends UpdateEntityUseCase<SubTaskRepository, SubTaskEntity> {
  UpdateSubTaskUsecase(super.repository);
}
