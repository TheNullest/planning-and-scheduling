import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/base_local_data_source_abstraction.dart';
import 'package:zamaan/core/services/hive_services.dart';
import 'package:zamaan/features/task/data/data_sources/bases/measurement_unit_data_source.dart';
import 'package:zamaan/features/task/data/models/local/local_models.dart';

class HiveMeasurementUnitDataSourceImpl
    extends BaseLocalDataSourceAbstraction<MeasurementUnitLocalModel>
    implements MeasurementUnitDataSource<MeasurementUnitLocalModel> {
  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<MeasurementUnitLocalModel>] like this
  HiveMeasurementUnitDataSourceImpl({
    HiveServices<MeasurementUnitLocalModel>? hiveBox,
  }) : super(HiveBoxConstants.MEASUREMENT_UNITS_BOX, hiveBox: hiveBox);
}
