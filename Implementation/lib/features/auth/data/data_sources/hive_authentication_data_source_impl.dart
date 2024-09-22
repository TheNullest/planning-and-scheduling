import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/hive_base_data_source_abstraction.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/features/auth/data/models/hive/hive_user_model.dart';

class HiveAuthenticationDataSourceImpl
    extends HiveBaseDataSourceAbstraction<HiveUserModel> {
  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<HiveUserModel>] like this
  HiveAuthenticationDataSourceImpl({HiveInitializer<HiveUserModel>? hiveBox})
      : super(HiveBoxConstants.USERS_BOX, hiveBox: hiveBox);
}
