import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/hive_base_data_source_abstraction.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/features/task/data/models/local/hive_tag_model.dart';

class HiveTagDataSourceImpl
    extends HiveBaseDataSourceAbstraction<HiveTagModel> {
  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<HiveTagModel>] like this
  HiveTagDataSourceImpl({HiveInitializer<HiveTagModel>? hiveBox})
      : super(HiveBoxConstants.TAGS_BOX, hiveBox: hiveBox);
}
