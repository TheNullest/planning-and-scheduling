import 'package:zamaan/core/data_sources/hive_base_data_source_abstraction.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/utils/typedef.dart';

abstract class BaseRepositoryAsbtraction<Entity extends BaseEntityAbstraction,
    HiveModel extends BaseEntityAbstraction> {
  final HiveBaseDataSourceAbstraction<HiveModel> _dataSource;
  final HiveModel _hiveModelHelper;

  BaseRepositoryAsbtraction(
      {required HiveBaseDataSourceAbstraction<HiveModel> dataSource,
      required HiveModel hiveModelHelper})
      : _dataSource = dataSource,
        _hiveModelHelper = hiveModelHelper;

  ResultFutureVoid createEntity({required Entity newEntity}) async {
    return await _dataSource.createEntity(
        newEntity: _hiveModelHelper.fromEntity(newEntity) as HiveModel);
  }

  ResultFutureVoid deleteEntity({required String id}) async =>
      _dataSource.deleteEntity(id: id);

  ResultFuture<List<Entity>> getEntities() async {
    final result = await _dataSource.getEntities();
    return result.map((either) =>
        either.map<Entity>((model) => model.toEntity() as Entity).toList());
  }

  ResultFuture<Entity> getEntity({required String id}) async {
    final Result<HiveModel> result = await _dataSource.getEntity(id: id);
    return result.map((either) => either.toEntity() as Entity);
  }

  ResultFutureVoid updateEntity({required Entity entity}) async => _dataSource
      .updateEntity(entity: _hiveModelHelper.fromEntity(entity) as HiveModel);
}
