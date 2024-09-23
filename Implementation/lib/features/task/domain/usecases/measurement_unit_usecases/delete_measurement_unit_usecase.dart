import 'package:zamaan/core/usecases/delete_entity_usecase.dart';
import 'package:zamaan/features/task/domain/repositories/measurement_unit_repository.dart';

class DeleteMeasurementUnitUsecase
    extends DeleteEntityUseCase<MeasurementUnitRepository> {
  DeleteMeasurementUnitUsecase(super.repository);
}
