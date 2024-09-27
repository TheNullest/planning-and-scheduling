import 'package:zamaan/core/repositories/base_crud_operations.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_measurement_unit_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_measurement_unit_model.dart';
import 'package:zamaan/features/task/domain/entities/measurement_unit_entity.dart';
import 'package:zamaan/features/task/domain/repositories/measurement_unit_repository.dart';

class MeasurementUnitRepositoryImpl extends BaseCRUDOperations<
    MeasurementUnitEntity,
    HiveMeasurementUnitModel,
    HiveMeasurementUnitDataSourceImpl> implements MeasurementUnitRepository {
  MeasurementUnitRepositoryImpl(super.dataSource);

  @override
  HiveMeasurementUnitModel fromEntity(MeasurementUnitEntity entity) =>
      HiveMeasurementUnitModel.fromEntity(entity);

  @override
  MeasurementUnitEntity toEntity(HiveMeasurementUnitModel model) =>
      model.toEntity();
}
