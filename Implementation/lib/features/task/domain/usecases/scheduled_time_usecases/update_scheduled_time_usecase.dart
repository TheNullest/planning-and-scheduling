import 'package:zamaan/core/usecases/update_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/scheduled_time_entity.dart';
import 'package:zamaan/features/task/domain/repositories/scheduled_time_repository.dart';

class UpdateScheduledTimeUsecase
    extends UpdateEntityUseCase<ScheduledTimeRepository, ScheduledTimeEntity> {
  UpdateScheduledTimeUsecase(super.repository);
}
