import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/base_local_data_source_abstraction.dart';
import 'package:zamaan/core/services/hive_services.dart';
import 'package:zamaan/features/task/data/data_sources/bases/tag_data_source.dart';
import 'package:zamaan/features/task/data/models/local/local_models.dart';

class HiveTagDataSourceImpl
    extends BaseLocalDataSourceAbstraction<TagLocalModel>
    implements TagDataSource<TagLocalModel> {
  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<TagLocalModel>] like this
  HiveTagDataSourceImpl({HiveServices<TagLocalModel>? hiveBox})
      : super(HiveBoxConstants.TAGS_BOX, hiveBox: hiveBox);
}
