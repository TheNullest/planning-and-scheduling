// ignore_for_file: void_checks

import 'package:zamaan/core/usecases/usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

class CreateUserUseCase
    extends UseCaseWithParams<AuthenticationRepository, void, UserEntity> {
  CreateUserUseCase(super.repository);

  @override
  ResultFutureVoid call(UserEntity params) async =>
      await repository.createEntity(newEntity: params);
}
