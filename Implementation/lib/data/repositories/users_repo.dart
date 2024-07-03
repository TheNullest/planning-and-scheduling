import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zamaan/data/models.dart';
import 'package:zamaan/data/repositories/hive_repository_abstraction.dart';

/// All the Users [CRUD] operation method for hive db
class UsersRepo extends HiveRepositoryAbstraction<UserModel> {
  static const String _boxName = 'usersBox';

  @override
  TypeAdapter<UserModel> get modelAdapter => UserModelAdapter();

  @override
  String get boxName => _boxName;

  @override
  Box<UserModel> get box => Hive.box<UserModel>(_boxName);

  @override
  Future<List<UserModel>> getAll() async {
    await initializeBox(boxName);
    return box.values.toList();
  }

  @override
  Future<UserModel?> getById(String id) async {
    await initializeBox(boxName);
    return box.get(id);
  }

  @override
  Future<UserModel?> getBySpecificValue(value) async {
    await initializeBox(boxName);
    final List<UserModel> users = await UsersRepo().getAll();
    for (UserModel user in users) {
      return user;
    }
    return null;
  }

  @override
  Future<bool> entityExist(String value) async {
    await initializeBox(boxName);
    final List<UserModel> users = await UsersRepo().getAll();
    for (UserModel user in users) {
      if (user.userName == value) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<void> save({required UserModel item}) async {
    await initializeBox(boxName);
    if (!await entityExist(item.userName)) await box.add(item);
  }

  @override
  Future<void> update({required UserModel item}) async {
    await initializeBox(boxName);
    await box.put(item.id, item);
  }

  @override
  Future<void> delete({required UserModel item}) async {
    await initializeBox(boxName);
    await item.delete();
  }

  @override
  Future<void> deleteAll() async {
    await initializeBox(boxName);
    await box.clear();
  }

  @override
  ValueListenable<Box<UserModel>> listenToModel() => box.listenable();
}
