import 'package:zamaan/core/usecases/update_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/measurement_unit_entity.dart';
import 'package:zamaan/features/task/domain/repositories/measurement_unit_repository.dart';

class UpdateMeasurementUnitUsecase extends UpdateEntityUseCase<
    MeasurementUnitRepository, MeasurementUnitEntity> {
  UpdateMeasurementUnitUsecase(super.repository);
}
