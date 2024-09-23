import 'package:zamaan/core/usecases/delete_entities_usecase.dart';
import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';

class DeleteAllSelectedTimeIntervalsUsecase
    extends DeleteEntitiesUseCase<TimeIntervalRepository> {
  DeleteAllSelectedTimeIntervalsUsecase(super.repository);
}
