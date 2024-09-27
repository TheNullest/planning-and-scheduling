import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/hive_base_data_source_abstraction.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/features/task/data/models/local/hive_measurement_unit_model.dart';

class HiveMeasurementUnitDataSourceImpl
    extends HiveBaseDataSourceAbstraction<HiveMeasurementUnitModel> {
  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<HiveMeasurementUnitModel>] like this
  HiveMeasurementUnitDataSourceImpl(
      {HiveInitializer<HiveMeasurementUnitModel>? hiveBox})
      : super(HiveBoxConstants.MEASUREMENT_UNITS_BOX, hiveBox: hiveBox);
}
