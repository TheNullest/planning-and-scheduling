import 'package:zamaan/core/usecases/update_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';
import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';

class UpdateTimeIntervalUsecase
    extends UpdateEntityUseCase<TimeIntervalRepository, TimeIntervalEntity> {
  UpdateTimeIntervalUsecase(super.repository);
}
