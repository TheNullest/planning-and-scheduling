import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';

abstract class GetEntityUseCase<Repo extends BaseRepositoryAbstraction,
        Entity extends BaseEntityAbstraction>
    extends UseCaseWithParams<Repo, Entity, String> {
  GetEntityUseCase(super.repository);
  @override
  ResultFuture<Entity> call(String params) async =>
      await repository.getEntity(id: params) as ResultFuture<Entity>;
}
