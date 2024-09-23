import 'package:zamaan/core/usecases/delete_entity_usecase.dart';
import 'package:zamaan/features/task/domain/repositories/scheduled_time_repository.dart';

class DeleteScheduledTimeUsecase
    extends DeleteEntityUseCase<ScheduledTimeRepository> {
  DeleteScheduledTimeUsecase(super.repository);
}
