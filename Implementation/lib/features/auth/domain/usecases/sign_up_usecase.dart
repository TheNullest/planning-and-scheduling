import 'package:zamaan/core/common/entities/user_entity.dart';
import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/domain/repositories/authentication_repository.dart';

class SignUpUsecase extends UseCaseWithParams<AuthenticationRepository,
    UserEntity, UserEntity> {
  SignUpUsecase(super.repository);

  @override
  ResultFuture<UserEntity> call(UserEntity params) async =>
      repository.signUp(params);
}
