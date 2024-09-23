import 'package:zamaan/core/usecases/get_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/scheduled_time_entity.dart';
import 'package:zamaan/features/task/domain/repositories/scheduled_time_repository.dart';

class GetScheduledTimeUsecase
    extends GetEntityUseCase<ScheduledTimeRepository, ScheduledTimeEntity> {
  GetScheduledTimeUsecase(super.repository);
}
