import 'package:zamaan/core/utils/typedef.dart';

abstract class UseCaseWithParams<Repo, ResultType, Params> {
  UseCaseWithParams(Repo repository) : _repository = repository;
  final Repo _repository;

  Repo get repository => _repository;

  ResultFuture<ResultType> call(Params params);
}

abstract class UseCaseWithoutParams<Repo, ResultType> {
  UseCaseWithoutParams(Repo repository) : _repository = repository;
  final Repo _repository;

  Repo get repository => _repository;

  ResultFuture<ResultType> call();
}
