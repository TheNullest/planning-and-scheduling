import 'package:zamaan/core/usecases/get_entities_usecase.dart';
import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';
import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';

class GetTimeIntervalsUsecase
    extends getEntitiesUseCase<TimeIntervalRepository, TimeIntervalEntity> {
  GetTimeIntervalsUsecase(super.repository);
}
