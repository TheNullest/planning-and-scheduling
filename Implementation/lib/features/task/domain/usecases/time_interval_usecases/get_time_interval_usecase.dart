import 'package:zamaan/core/usecases/get_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';
import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';

class GetTimeIntervalUsecase
    extends GetEntityUseCase<TimeIntervalRepository, TimeIntervalEntity> {
  GetTimeIntervalUsecase(super.repository);
}
