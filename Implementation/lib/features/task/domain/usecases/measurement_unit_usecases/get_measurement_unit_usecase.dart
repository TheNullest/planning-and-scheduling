import 'package:zamaan/core/usecases/get_entity_usecase.dart';
import 'package:zamaan/features/task/domain/entities/measurement_unit_entity.dart';
import 'package:zamaan/features/task/domain/repositories/measurement_unit_repository.dart';

class GetMeasurementUnitUsecase
    extends GetEntityUseCase<MeasurementUnitRepository, MeasurementUnitEntity> {
  GetMeasurementUnitUsecase(super.repository);
}
