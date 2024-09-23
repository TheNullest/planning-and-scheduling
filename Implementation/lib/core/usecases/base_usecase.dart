import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/utils/typedef.dart';

abstract class UseCaseWithParams<Entity extends BaseEntityAbstraction,
    Repo extends BaseRepositoryAbstraction<Entity>, ResultType, Params> {
  final Repo _repository;

  UseCaseWithParams(Repo repository) : _repository = repository;

  Repo get repository => _repository;

  ResultFuture<ResultType> call(Params params);
}

abstract class UseCaseWithoutParams<Repo extends BaseRepositoryAbstraction,
    ResultType> {
  final Repo _repository;

  UseCaseWithoutParams(Repo repository) : _repository = repository;

  Repo get repository => _repository;

  ResultFuture<ResultType> call();
}
