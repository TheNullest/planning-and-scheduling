import 'package:zamaan/core/usecases/usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

class GetUserUsecase
    extends UseCaseWithParams<AuthenticationRepository, UserEntity, String> {
  GetUserUsecase(super.repository);

  @override
  ResultFuture<UserEntity> call(String params) async =>
      await repository.getEntity(id: params);
}
