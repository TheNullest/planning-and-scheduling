import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';

abstract class getEntitiesUseCase<
        Repo extends BaseRepositoryAbstraction<Entity>,
        Entity extends BaseEntityAbstraction>
    extends UseCaseWithoutParams<Repo, List<Entity>> {
  getEntitiesUseCase(super.repository);
  @override
  ResultFuture<List<Entity>> call() async => await repository.getEntities();
}
