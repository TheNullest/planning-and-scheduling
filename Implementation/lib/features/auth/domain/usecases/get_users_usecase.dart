import 'package:zamaan/core/usecases/usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

class GetUsersUsecase
    extends UseCaseWithoutParams<AuthenticationRepository, List<UserEntity>> {
  GetUsersUsecase(super.repository);

  @override
  ResultFuture<List<UserEntity>> call() async => await repository.getEntities();
}
