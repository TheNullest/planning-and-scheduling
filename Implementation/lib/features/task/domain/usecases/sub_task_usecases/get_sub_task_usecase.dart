import 'package:zamaan/core/usecases/get_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/sub_task_repository.dart';

class GetSubTaskUsecase
    extends GetEntityUseCase<SubTaskRepository, SubTaskEntity> {
  GetSubTaskUsecase(super.repository);
}
