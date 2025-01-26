import 'package:dartz/dartz.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/data_sources/base_data_source_abstraction.dart';
import 'package:zamaan/core/utils/try_catch.dart';
import 'package:zamaan/core/utils/typedef.dart';

abstract class BaseCRUDOperations<
    Entity extends BaseEntityAbstraction,
    LocalModel extends Entity,
    LocalDataSource extends BaseDataSourceAbstraction<LocalModel>> {
  BaseCRUDOperations(LocalDataSource localDataSource)
      : _localDataSource = localDataSource;
  final LocalDataSource _localDataSource;

  LocalModel fromEntity(Entity entity);
  Entity toEntity(LocalModel model);

  ResultFutureVoid createEntity({required Entity newEntity}) async {
    return tryCatchEither(
      action: () async => _localDataSource
          .createEntity(newEntity: fromEntity(newEntity))
          .then((_) => const Right(null)),
    );
  }

  ResultFuture<List<Entity>?> getEntities() async {
    return tryCatchEither<List<Entity>?>(
      action: () async {
        final models = await _localDataSource.getEntities();
        return models.map((models) => models.map(toEntity).toList());
      },
    );
  }

  ResultFuture<Entity?> getEntity({required String id}) async =>
      tryCatchEither<Entity?>(
        action: () async {
          final model = await _localDataSource.getEntity(id: id);
          return model.map(toEntity);
        },
      );

  ResultFutureVoid updateEntity({required Entity entity}) async =>
      tryCatchEither(
        action: () async => _localDataSource
            .updateEntity(entity: fromEntity(entity))
            .then((_) => const Right(null)),
      );

  ResultFutureVoid deleteEntity({required String id}) async => tryCatchEither(
        action: () async => _localDataSource
            .deleteEntity(id: id)
            .then((_) => const Right(null)),
      );

  ResultFutureVoid deleteAllSelected(List<String> keys) async => tryCatchEither(
        action: () async => _localDataSource
            .deleteAllSelected(keys)
            .then((_) => const Right(null)),
      );
}
