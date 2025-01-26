import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/utils/typedef.dart';

abstract class BaseDataSourceAbstraction<Model extends BaseEntityAbstraction> {
  ResultFutureVoid createEntity({required Model newEntity});

  ResultFuture<List<Model>> getEntities();

  ResultFuture<Model> getEntity({required String id});

  ResultFutureVoid updateEntity({required Model entity});

  ResultFutureVoid deleteEntity({required String id});

  ResultFutureVoid deleteAllSelected(List<String> keys);
}
