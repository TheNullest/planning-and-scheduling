import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';

abstract class GetEntityUseCase<Repo extends BaseRepositoryAbstraction<Entity>,
        Entity extends BaseEntityAbstraction>
    extends UseCaseWithParams<Repo, Entity?, String> {
  GetEntityUseCase(super.repository);
  @override
  ResultFuture<Entity?> call(String params) async =>
      repository.getEntity(id: params);
}
