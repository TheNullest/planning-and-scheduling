import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/hive_base_data_source_abstraction.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/features/task/data/models/local/hive_category_model.dart';

class HiveCategoryDataSourceImpl
    extends HiveBaseDataSourceAbstraction<HiveCategoryModel> {
  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<HiveCategoryModel>] like this
  HiveCategoryDataSourceImpl({HiveInitializer<HiveCategoryModel>? hiveBox})
      : super(HiveBoxConstants.CATEGOREIS_BOX, hiveBox: hiveBox);
}
