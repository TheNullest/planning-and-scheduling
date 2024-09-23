import 'package:zamaan/core/usecases/create_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/scheduled_time_entity.dart';
import 'package:zamaan/features/task/domain/repositories/scheduled_time_repository.dart';

class CreateScheduledTimeUsecase
    extends CreateEntityUseCase<ScheduledTimeRepository, ScheduledTimeEntity> {
  CreateScheduledTimeUsecase(super.repository);
}
