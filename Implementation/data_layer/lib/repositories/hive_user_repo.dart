import 'package:hive_flutter/hive_flutter.dart';
import '../models/models.dart';
import 'hive_base_repository_abstraction.dart';

/// All the Users [CRUD] operation method for hive db
class HiveUserRepo extends HiveBaseRepositoryAbstraction<UserModel> {
  static const String _boxName = 'usersBox';

  @override
  TypeAdapter<UserModel> get modelAdapter => UserModelAdapter();

  @override
  String get boxName => _boxName;
}
