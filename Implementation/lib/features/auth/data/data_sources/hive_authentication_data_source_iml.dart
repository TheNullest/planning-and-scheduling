import 'package:hive/hive.dart';
import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/data_sources/hive_base_data_source_abstraction.dart';
import 'package:zamaan/features/auth/data/models/hive/hive_user_model.dart';

//TODO #8 Implement the test HiveAuthenticationDataSourceImpl
class HiveAuthenticationDataSourceImpl
    extends HiveBaseDataSourceAbstraction<HiveUserModel> {
  @override
  String get boxName => HiveBoxConstants.USERS_BOX;

  @override
  TypeAdapter<HiveUserModel> get modelAdapter => HiveUserModelAdapter();
}
