// ignore_for_file: void_checks

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/core/utils/try_catch.dart';
import 'package:zamaan/core/utils/typedef.dart';

/// The **[HiveModel]** has to be **[HiveModel]** class not the **[~~Entity class~~]**
abstract class HiveBaseDataSourceAbstraction<
    HiveModel extends BaseEntityAbstraction> {
  Future<Either<HiveFailure, T>> execute<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return Right(result);
    } on HiveFailure {
      rethrow;
    } catch (e) {
      return Left(HiveFailure(e.toString()));
    }
  }

  /// Abstract getter for the adapter type
  TypeAdapter<HiveModel> get modelAdapter;

  /// Abstract getter for the box name
  String get boxName;

  /// Abstract methods requiring implementation in subclasses
  late Box<HiveModel>? _box;
  Box<HiveModel> get box => _box!;

  /// #### Saves the `[item]` to the Hive box conditionally.
  ResultFutureVoid createEntity({
    required HiveModel newEntity,
  }) async {
    await initializeBox();
    return tryCatch<void>(() async =>
        // The add function retruns the key of the newEntity
        await _box!.put(newEntity.id, newEntity));

    // try {
    //   // box = await this.box -----> this.box is the Future<Box<T>> get box;
    //   _box!.add(newEntity);
    //   log("on save : saved");
    //   return const Right(true);
    // } on Exception catch (e) {
    //   //TODO Implement appropriate message display
    //   return Left(HiveFailure("Error on save : $e"));
    // }
  }

  /// Retrieves all items from the Hive box.
  ResultFuture<List<HiveModel>> getEntities() async {
    await initializeBox();
    return tryCatch<List<HiveModel>>(() async => _box!.values.toList());
  }
  // try {
  //   return Right(_box!.values.toList());
  // } catch (e) {
  //   //TODO Implement appropriate message display
  //   return Left(HiveFailure("Error on getAll : $e"));
  // }

  /// Retrieves an item from the Hive box based on its **ID**.
  ResultFuture<HiveModel> getEntity({required String id}) async {
    await initializeBox();
    return tryCatch<HiveModel>(() async => _box!.values.firstWhere(
          (item) => item.id == id,
        ));
  }

  /// Updates the `[item]` in the Hive box.
  ResultFutureVoid updateEntity({required HiveModel entity}) async {
    await initializeBox();
    return tryCatch<void>(() async => await _box!.put(entity.id, entity));
  }

  /// Deletes an item from the Hive box by key.
  ResultFutureVoid deleteEntity({required String id}) async {
    await initializeBox();
    return tryCatch<void>(() async => await _box!.delete(id));
  }

  /// Initializes the Hive box and registers adapters.
  ResultFutureVoid initializeBox() async =>

      /// Ensures if the Hive box is open and returns it.
      tryCatch<void>(() async {
        if (!Hive.isBoxOpen(boxName) || _box == null) {
          final Directory appDocumentsDir =
              Directory('E:\\Flutter.Dart\\HiveFiles\\Zamaan');
          if (!await appDocumentsDir.exists()) {
            await appDocumentsDir.create(recursive: true);
          }
          await Hive.initFlutter(appDocumentsDir.path);
          Hive.registerAdapter<HiveModel>(modelAdapter);

          /// Be careful to close the box after using and exiting it
          _box = await Hive.openBox<HiveModel>(boxName);
        }
      });

  /// Close the Hive box when the repository is no longer needed.
  ResultFutureVoid dispose() async => tryCatch<void>(() async {
        if (_box != null) {
          await _box!.close();
          _box = null;
        }
      });
}
