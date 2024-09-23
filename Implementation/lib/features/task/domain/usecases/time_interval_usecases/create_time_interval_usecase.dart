import 'package:zamaan/core/usecases/create_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/task_time_interval_entity.dart';
import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';

class CreateTimeIntervalUsecase
    extends CreateEntityUseCase<TimeIntervalRepository, TimeIntervalEntity> {
  CreateTimeIntervalUsecase(super.repository);
}
