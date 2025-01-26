// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/data_sources/base_data_source_abstraction.dart';
import 'package:zamaan/core/enums/failure_type.dart';
import 'package:zamaan/core/errors/exceptions/local_exception.dart';
import 'package:zamaan/core/services/hive_services.dart';
import 'package:zamaan/core/utils/try_catch.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/core/utils/uuid.dart';

/// The **[HiveModel]** has to be **[HiveModel]** class not the **[~~Entity class~~]**
abstract class BaseLocalDataSourceAbstraction<
        HiveModel extends BaseEntityAbstraction>
    extends BaseDataSourceAbstraction<HiveModel> {
  // Just to add the testablity feature to the class,
  // we need to inject the [HiveInitializer<HiveModel>] like this
  BaseLocalDataSourceAbstraction(
    this._boxName, {
    HiveServices<HiveModel>? hiveBox,
  }) : _hiveBox = hiveBox ?? HiveServices<HiveModel>();
  final String _boxName;
  final HiveServices<HiveModel> _hiveBox;

  /// #### Saves the `[item]` to the Hive box conditionally.
  @override
  ResultFutureVoid createEntity({
    required HiveModel newEntity,
  }) async =>
      _hiveBox.operator(
        job: (box) async => box.put(newEntity.id, newEntity),
        boxName: _boxName,
      );

  /// Retrieves all items from the Hive box.
  @override
  ResultFuture<List<HiveModel>> getEntities() async =>
      _hiveBox.operator<List<HiveModel>>(
        job: (box) async => box.values.toList(),
        boxName: _boxName,
      );

  /// Retrieves an item from the Hive box based on its **ID**.
  @override
  ResultFuture<HiveModel> getEntity({required String id}) async =>
      tryCatchEither(
        action: () async => _hiveBox.operator<HiveModel>(
          job: (box) async => box.values.firstWhere((item) => item.id == id),
          boxName: _boxName,
        ),
        failureType: FailureType.local,
      );

  /// Updates the `[item]` in the Hive box.
  ///
  /// Becuase the entity.id is already save, the put command will
  /// replace the existing data,
  ///
  /// for this reason, the [createEntity] function is used again
  @override
  ResultFutureVoid updateEntity({required HiveModel entity}) async =>
      createEntity(newEntity: entity);

  /// Deletes an item from the Hive box by key.
  @override
  ResultFutureVoid deleteEntity({required String id}) async {
    if (!isValidUUID(id)) {
      throw LocalException(
        message: 'This $id is not a valid [UUID] ',
        errorLocation: 'BaseLocalDataSourceAbstraction.deleteEntity',
      );
    }
    return _hiveBox.operator<void>(
      job: (box) async => box.delete(id),
      boxName: _boxName,
    );
  }

  /// Deletes an item from the Hive box by key.
  @override
  ResultFutureVoid deleteAllSelected(List<String> keys) async {
    final invalidKeys = <String>[];

    for (final key in keys) {
      if (!isValidUUID(key)) invalidKeys.add(key);
    }
    if (invalidKeys.isNotEmpty) {
      throw LocalException(
        message: 'This $id is not a valid [UUID] ',
        errorLocation: 'BaseLocalDataSourceAbstraction.deleteEntity',
      );
    }

    return _hiveBox.operator<void>(
      job: (box) async => box.deleteAll(keys),
      boxName: _boxName,
    );
  }
}
