import 'package:zamaan/core/usecases/get_entities_usecase.dart';
import 'package:zamaan/features/task/domain/entities/scheduled_time_entity.dart';
import 'package:zamaan/features/task/domain/repositories/scheduled_time_repository.dart';

class GetScheduledTimesUsecase
    extends GetEntitiesUseCase<ScheduledTimeRepository, ScheduledTimeEntity> {
  GetScheduledTimesUsecase(super.repository);
}
