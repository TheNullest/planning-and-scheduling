import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

abstract class UseCaseWithParams<Repo extends AuthenticationRepository,
    ResultType, Params> {
  final Repo _repository;

  UseCaseWithParams(Repo repository) : _repository = repository;

  Repo get repository => _repository;

  ResultFuture<ResultType> call(Params params);
}

abstract class UseCaseWithoutParams<Repo extends AuthenticationRepository,
    ResultType> {
  final Repo _repository;

  UseCaseWithoutParams(Repo repository) : _repository = repository;

  Repo get repository => _repository;

  ResultFuture<ResultType> call();
}
