import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/base_local_data_source_abstraction.dart';
import 'package:zamaan/core/services/hive_services.dart';
import 'package:zamaan/features/task/data/data_sources/bases/category_data_source.dart';
import 'package:zamaan/features/task/data/models/local/local_models.dart';

class HiveCategoryDataSourceImpl
    extends BaseLocalDataSourceAbstraction<CategoryLocalModel>
    implements CategoryDataSource<CategoryLocalModel> {
  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<CategoryLocalModel>] like this
  HiveCategoryDataSourceImpl({HiveServices<CategoryLocalModel>? hiveBox})
      : super(HiveBoxConstants.CATEGOREIS_BOX, hiveBox: hiveBox);
}
