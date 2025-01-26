import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';

abstract class UpdateEntityUseCase<Entity extends BaseEntityAbstraction,
        Repo extends BaseRepositoryAbstraction<Entity>>
    extends UseCaseWithParams<Repo, void, Entity> {
  UpdateEntityUseCase(super.repository);
  @override
  ResultFutureVoid call(Entity params) async =>
      repository.updateEntity(entity: params);
}
