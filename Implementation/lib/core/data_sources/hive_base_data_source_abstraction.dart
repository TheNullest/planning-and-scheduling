// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/core/utils/uuid.dart';

/// The **[HiveModel]** has to be **[HiveModel]** class not the **[~~Entity class~~]**
abstract class HiveBaseDataSourceAbstraction<
    HiveModel extends BaseEntityAbstraction> {
  final String _boxName;
  final HiveInitializer<HiveModel> _hiveBox;

  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<HiveModel>] like this
  HiveBaseDataSourceAbstraction(this._boxName,
      {HiveInitializer<HiveModel>? hiveBox})
      : _hiveBox = hiveBox ?? HiveInitializer<HiveModel>();
  // Just to add the testablity feature to the class

  /// #### Saves the `[item]` to the Hive box conditionally.
  ResultFutureVoid createEntity({
    required HiveModel newEntity,
  }) async =>
      await _hiveBox.operator<void>(
        job: (box) async => await box.put(newEntity.id, newEntity),
        boxName: _boxName,
      );

  /// Retrieves all items from the Hive box.
  ResultFuture<List<HiveModel>> getEntities() async =>
      await _hiveBox.operator<List<HiveModel>>(
        job: ((box) async => box.values.toList()),
        boxName: _boxName,
      );

  /// Retrieves an item from the Hive box based on its **ID**.
  ResultFuture<HiveModel> getEntity({required String id}) async =>
      await _hiveBox.operator<HiveModel>(
          job: (box) async => box.values.firstWhere((item) => item.id == id),
          boxName: _boxName);

  /// Updates the `[item]` in the Hive box.
  ///
  /// Becuase the entity.id is already save, the put command will
  /// replace the existing data,
  ///
  /// for this reason, the [createEntity] function is used again
  ResultFutureVoid updateEntity({required HiveModel entity}) async =>
      await createEntity(newEntity: entity);

  /// Deletes an item from the Hive box by key.
  ResultFutureVoid deleteEntity({required String id}) async {
    if (!isValidUUID(id)) {
      return Left(HiveFailure('This $id is not a valid [UUID] '));
    }
    return await _hiveBox.operator<void>(
      job: (box) async => await box.delete(id),
      boxName: _boxName,
    );
  }

  /// Deletes an item from the Hive box by key.
  ResultFutureVoid deleteAllSelected(List<String> keys) async {
    List<String> invalidKeys = [];

    for (String key in keys) {
      if (!isValidUUID(key)) invalidKeys.add(key);
    }
    if (invalidKeys.isNotEmpty) {
      return Left(HiveFailure('This $invalidKeys are not a valid [UUID] '));
    }

    return await _hiveBox.operator<void>(
      job: (box) async => await box.deleteAll(keys),
      boxName: _boxName,
    );
  }
}
