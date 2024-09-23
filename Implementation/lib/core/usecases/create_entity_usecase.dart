import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';

abstract class CreateEntityUseCase<Repo extends BaseRepositoryAbstraction,
        Entity extends BaseEntityAbstraction>
    extends UseCaseWithParams<Repo, void, Entity> {
  CreateEntityUseCase(super.repository);
  @override
  ResultFutureVoid call(Entity params) async =>
      await repository.createEntity(newEntity: params);
}
