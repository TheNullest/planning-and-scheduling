import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';

abstract class DeleteEntitiesUseCase<Repo extends BaseRepositoryAbstraction>
    extends UseCaseWithParams<BaseEntityAbstraction, Repo, void, List<String>> {
  DeleteEntitiesUseCase(super.repository);
  @override
  ResultFutureVoid call(List<String> params) async =>
      await repository.deleteAllSelected(params);
}
