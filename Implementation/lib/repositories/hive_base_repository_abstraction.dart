import 'dart:developer';
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:zamaan/models/bases/base_type_adapter_asbtract.dart';
import 'package:zamaan/models/models.dart';

/// **[T]** as type of data model
///
/// **[S]** as the query type to search for
abstract class HiveBaseRepositoryAbstraction<T extends HiveObject> {
  /// Abstract getter for the adapter type
  TypeAdapter<T> get modelAdapter;

  /// Abstract getter for the box name
  String get boxName;

  /// Abstract methods requiring implementation in subclasses
  Box<T>? _box;

  Future<Box<T>> getBox() async {
    if (!Hive.isBoxOpen(boxName) || _box == null) {
      await initializeBox();
    }
    return _box!;
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
  }) async {
    try {
      // box = await this.box -----> this.box is the Future<Box<T>> get box;
      (await getBox()).add(item);
      log("on save : saved");
      return true;
    } on Exception catch (e) {
      log("Error on save : $e");
      return false;
    }
  }

  Future<List<T>> getAll() async {
    try {
      return (await getBox()).values.toList();
    } catch (e) {
      log("Error on getAll : $e");
      return [];
    }
  }

  Future<void> update({required T item}) async {
    try {
      await (await getBox()).put(item.key, item);
    } on Exception catch (e) {
      log("Error on update : $e");
    }
  }

  Future<void> delete({required T item}) async {
    try {
      await item.delete();
    } on Exception catch (e) {
      log("Error on delete : $e");
    }
  }

  Future<void> deleteAll() async {
    try {
      await (await getBox()).clear();
    } on Exception catch (e) {
      log("Error on deleteAll : $e");
    }
  }

  /// Separate method for box initialization (can optionally be abstract)
  Future<void> initializeBox() async {
    try {
      final Directory appDocumentsDir =
          Directory('E:\\Flutter.Dart\\HiveFiles\\Zamaan');
      await Hive.initFlutter(appDocumentsDir.path);

      final List<BaseTypeAdapterAbstract> adapters = [
        MainTaskModelAdapter(),
        UserModelAdapter(),
        TaskDoingTimeIntervalModelAdapter(),
        SelectedWeekDaysModelAdapter(),
        ScheduledTaskTimeIntervalModelAdapter(),
        SubTaskModelAdapter(),
        TagModelAdapter(),
        GoalModelAdapter(),
      ];

      for (BaseTypeAdapterAbstract adapter in adapters) {
        adapter.registerAdapter();
      }

      /// Be careful to close the box after using a widget and exiting it
      _box = await Hive.openBox<T>(boxName);
    } on Exception catch (e) {
      log("Error on initializeBox : $e");
    }
  }

  // This feature is more correctly implemented in the viewModel section
  // Future<ValueListenable<Box<T>>> listenToModel() async =>
  //     (await getBox()).listenable();

  /// For closing Hive box when the repository is no longer needed.
  Future<void> dispose() async {
    if (_box != null) {
      await _box!.close();
      _box = null;
    }
  }
}
