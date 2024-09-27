import 'package:zamaan/core/data_sources/hive_base_data_source_abstraction.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/utils/try_catch.dart';
import 'package:zamaan/core/utils/typedef.dart';

abstract class BaseCRUDOperations<
        Entity extends BaseEntityAbstraction,
        HiveModel extends Entity,
        DataSource extends HiveBaseDataSourceAbstraction>
    extends BaseRepositoryAbstraction<Entity> {
  final DataSource _dataSource;
  BaseCRUDOperations(DataSource dataSource) : _dataSource = dataSource;

  HiveModel fromEntity(Entity entity);
  Entity toEntity(HiveModel model);

  @override
  ResultFutureVoid createEntity({required Entity newEntity}) async {
    return tryCatch<void>(
      () async =>
          await _dataSource.createEntity(newEntity: fromEntity(newEntity)),
    );
  }

  @override
  ResultFuture<List<Entity>> getEntities() async {
    final entities = await _dataSource.getEntities();
    return entities.map((either) =>
        either.map<Entity>((model) => toEntity(model as HiveModel)).toList());
  }

  @override
  ResultFuture<Entity> getEntity({required String id}) async {
    final entities = await _dataSource.getEntity(id: id);
    return entities.map((model) => toEntity(model as HiveModel));
  }

  @override
  ResultFutureVoid updateEntity({required Entity entity}) async =>
      await _dataSource.updateEntity(entity: fromEntity(entity));

  @override
  ResultFutureVoid deleteEntity({required String id}) async =>
      await _dataSource.deleteEntity(id: id);

  @override
  ResultFutureVoid deleteAllSelected(List<String> keys) async {
    return await _dataSource.deleteAllSelected(keys);
  }
}
