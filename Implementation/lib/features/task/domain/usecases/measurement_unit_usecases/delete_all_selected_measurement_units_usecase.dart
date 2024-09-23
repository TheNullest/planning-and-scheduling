import 'package:zamaan/core/usecases/delete_entities_usecase.dart';
import 'package:zamaan/features/task/domain/repositories/measurement_unit_repository.dart';

class DeleteAllSelectedMeasurementUnitsUsecase
    extends DeleteEntitiesUseCase<MeasurementUnitRepository> {
  DeleteAllSelectedMeasurementUnitsUsecase(super.repository);
}
