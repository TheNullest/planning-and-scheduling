import 'package:hive_flutter/hive_flutter.dart';
import 'package:zamaan/models/models.dart';
import 'package:zamaan/repositories/hive_base_repository_abstraction.dart';

/// All the Users [CRUD] operation method for hive db
class HiveUsersRepo extends HiveBaseRepositoryAbstraction<UserModel> {
  static const String _boxName = 'usersBox';

  @override
  TypeAdapter<UserModel> get modelAdapter => UserModelAdapter();

  @override
  String get boxName => _boxName;
}
