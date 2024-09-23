import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';

abstract class UpdateEntityUseCase<
        Repo extends BaseRepositoryAbstraction<Entity>,
        Entity extends BaseEntityAbstraction>
    extends UseCaseWithParams<Entity, Repo, void, Entity> {
  UpdateEntityUseCase(super.repository);
  @override
  ResultFutureVoid call(Entity params) async =>
      await repository.updateEntity(entity: params);
}
