import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveRepositoryAbstraction<T extends HiveObject> {
  /// Abstract getter for the adapter type
  TypeAdapter<T> get modelAdapter;

  /// Abstract getter for the box name
  String get boxName;

  /// Abstract methods requiring implementation in subclasses
  Box<T> get box;
  Future<bool> entityExist(String value);
  Future<void> save({required T item});
  Future<List<T>> getAll();
  Future<T?> getById(String id);
  Future<T?> getBySpecificValue(dynamic value);
  Future<void> update({required T item});
  Future<void> delete({required T item});
  Future<void> deleteAll();
  ValueListenable<Box<T>> listenToModel();

  /// Separate method for box initialization (can optionally be abstract)
  Future<void> initializeBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) return;

    await Hive.initFlutter();
    Hive.registerAdapter<T>(modelAdapter);
    await Hive.openBox<T>(boxName);
  }
}
