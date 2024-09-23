import 'package:zamaan/core/usecases/delete_entity_usecase.dart';
import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';

class DeleteTimeIntervalUsecase
    extends DeleteEntityUseCase<TimeIntervalRepository> {
  DeleteTimeIntervalUsecase(super.repository);
}
