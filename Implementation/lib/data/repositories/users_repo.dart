import 'package:hive_flutter/hive_flutter.dart';
import 'package:zamaan/data/models.dart';
import 'package:zamaan/data/repositories/hive_base_repository_abstraction.dart';

/// All the Users [CRUD] operation method for hive db
class UsersRepo extends HiveBaseRepositoryAbstraction<UserModel, String> {
  static const String _boxName = 'usersBox';

  @override
  TypeAdapter<UserModel> get modelAdapter => UserModelAdapter();

  @override
  String get boxName => _boxName;

  @override
  Future<void> getBySpecificValue(
      {required void Function(UserModel?) callback,
      required String value}) async {
    await initializeBox(boxName: boxName);
    final List<UserModel> users = await getAll();
    callback(users.where((user) => user.userName == value).firstOrNull);
  }
}
