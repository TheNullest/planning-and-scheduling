import 'package:zamaan/core/repositories/base_repository_abstraction.dart';
import 'package:zamaan/core/utils/typedef.dart';

abstract class UseCaseWithParams<Repo extends BaseRepositoryAsbtraction,
    ResultType, Params> {
  final Repo _repository;

  UseCaseWithParams(Repo repository) : _repository = repository;

  Repo get repository => _repository;

  ResultFuture<ResultType> call(Params params);
}

abstract class UseCaseWithoutParams<Repo extends BaseRepositoryAsbtraction,
    ResultType> {
  final Repo _repository;

  UseCaseWithoutParams(Repo repository) : _repository = repository;

  Repo get repository => _repository;

  ResultFuture<ResultType> call();
}
