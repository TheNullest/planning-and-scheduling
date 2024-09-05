import 'dart:developer';
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import '../models/bases/base_type_adapter_asbtraction.dart';
import '../models/models.dart';

/// **[T]** as type of data model
///
/// **[S]** as the query type to search for
abstract class HiveBaseRepositoryAbstraction<T extends BaseModelAbstraction> {
  /// Abstract getter for the adapter type
  TypeAdapter<T> get modelAdapter;

  /// Abstract getter for the box name
  String get boxName;

  /// Abstract methods requiring implementation in subclasses
  Box<T>? _box;

  /// Ensures the Hive box is open and returns it.
  Future<Box<T>> getBox() async {
    if (!Hive.isBoxOpen(boxName) || _box == null) {
      await initializeBox();
    }
    return _box!;
  }

  /// #### Saves the `[item]` to the Hive box conditionally.
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

  /// Retrieves all items from the Hive box.
  Future<List<T>> getAll() async {
    try {
      return (await getBox()).values.toList();
    } catch (e) {
      log("Error on getAll : $e");
      return [];
    }
  }

  /// Updates the `[item]` in the Hive box.
  Future<void> update({required T item}) async {
    try {
      await (await getBox()).put(item.key, item);
    } on Exception catch (e) {
      log("Error on update : $e");
    }
  }

  /// Deletes an item from the Hive box by key.
  Future<void> delete({required String id}) async {
    try {
      await (await getBox()).delete(id);
    } on Exception catch (e) {
      log("Error on delete : $e");
    }
  }

  //TODO Do we need this method?
  /// Deletes all items from the Hive box.
  Future<void> deleteAll() async {
    /// Deletes all items from the Hive box.

    try {
      await (await getBox()).clear();
    } on Exception catch (e) {
      log("Error on deleteAll : $e");
    }
  }

  /// Initializes the Hive box and registers adapters.
  Future<void> initializeBox() async {
    try {
      final Directory appDocumentsDir =
          Directory('E:\\Flutter.Dart\\HiveFiles\\Zamaan');
      await Hive.initFlutter(appDocumentsDir.path);

      final List<BaseTypeAdapterAbstraction> adapters = [
        MainTaskModelAdapter(),
        UserModelAdapter(),
        TaskTimeIntervalModelAdapter(),
        SelectedWeekDaysModelAdapter(),
        ScheduledTaskTimeIntervalModelAdapter(),
        SubTaskModelAdapter(),
        TagModelAdapter(),
        GoalModelAdapter(),
      ];

      for (BaseTypeAdapterAbstraction adapter in adapters) {
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

  /// Close the Hive box when the repository is no longer needed.
  Future<void> dispose() async {
    if (_box != null) {
      await _box!.close();
      _box = null;
    }
  }
}
