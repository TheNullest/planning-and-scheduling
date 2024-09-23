import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';

abstract class DeleteEntityUseCase<Repo extends BaseRepositoryAbstraction>
    extends UseCaseWithParams<Repo, void, String> {
  DeleteEntityUseCase(super.repository);
  @override
  ResultFutureVoid call(String params) async =>
      await repository.deleteEntity(id: params);
}
