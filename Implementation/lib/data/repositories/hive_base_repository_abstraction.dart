import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// **[T]** as type of data model
///
/// **[S]** as the specific value type to search for
abstract class HiveBaseRepositoryAbstraction<T extends HiveObject, S> {
  /// Abstract getter for the adapter type
  TypeAdapter<T> get modelAdapter;

  /// Abstract getter for the box name
  String get boxName;

  /// Abstract methods requiring implementation in subclasses
  Box<T> get box => Hive.box<T>(boxName);

  Future<bool> entityExist({required bool Function(T entity) callback}) async {
    await initializeBox(boxName: boxName);
    final List<T> users = await getAll();

    return users.where(callback).isNotEmpty;
  }

  /// #### Saves the `[item]` to the Hive box conditionally.
  ///
  /// **item** : The `[item]` will only be saved if the `[callback]` returns false (doesn't exist).
  /// The `[item]` to be saved of type `[T]`, matching your data model).
  ///
  /// **callback** : A `[callback]` function that takes an item of type `[T]` and returns a boolean.
  /// This function defines the criteria for checking if the item already exists.
  Future<bool> save({
    required T item,
    required bool Function(T entity) callback,
  }) async {
    await initializeBox(boxName: boxName);
    if (!await entityExist(callback: callback)) {
      await box.add(item);
      return true;
    }
    return false;
  }

  Future<void> getBySpecificValue(
      {required void Function(T?) callback, required S value});

  Future<List<T>> getAll() async {
    await initializeBox(boxName: boxName);
    try {
      return box.values.toList();
    } on Exception {
      return [];
    }
  }

  Future<List<T>> sort(
      {required int Function(T a, T b) compareFunction}) async {
    final allItems = await getAll();
    return allItems..sort(compareFunction);
  }

  Future<T?> getById({required String id}) async {
    await initializeBox(boxName: boxName);
    return box.get(id);
  }

  Future<void> update({required T item}) async {
    await initializeBox(boxName: boxName);
    await box.put(item.key, item);
  }

  Future<void> delete({required T item}) async {
    await initializeBox(boxName: boxName);
    await item.delete();
  }

  Future<void> deleteAll() async {
    await initializeBox(boxName: boxName);
    await box.clear();
  }

  ValueListenable<Box<T>> listenToModel() => box.listenable();

  /// Separate method for box initialization (can optionally be abstract)
  Future<void> initializeBox({required String boxName}) async {
    if (Hive.isBoxOpen(boxName)) return;

    await Hive.initFlutter();
    Hive.registerAdapter<T>(modelAdapter);

    ///TODO Be careful to close the box after using a widget and exiting it
    await Hive.openBox<T>(boxName);
  }
}
