import 'package:zamaan/core/usecases/get_entities_usecase.dart';
import 'package:zamaan/features/task/domain/entities/measurement_unit_entity.dart';
import 'package:zamaan/features/task/domain/repositories/measurement_unit_repository.dart';

class GetMeasurementUnitsUsecase extends GetEntitiesUseCase<
    MeasurementUnitRepository, MeasurementUnitEntity> {
  GetMeasurementUnitsUsecase(super.repository);
}
