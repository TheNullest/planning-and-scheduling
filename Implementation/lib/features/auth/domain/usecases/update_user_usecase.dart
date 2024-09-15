import 'package:zamaan/core/usecases/usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

class UpdateUserUseCase
    extends UseCaseWithParams<AuthenticationRepository, void, UserEntity> {
  UpdateUserUseCase(super.repository);

  @override
  ResultFutureVoid call(UserEntity params) async =>
      await repository.updateEntity(entity: params);
}
