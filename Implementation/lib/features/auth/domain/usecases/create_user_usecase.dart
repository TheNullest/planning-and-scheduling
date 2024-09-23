import 'package:zamaan/core/usecases/create_entity_usecase.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

class CreateUserUseCase
    extends CreateEntityUseCase<AuthenticationRepository, UserEntity> {
  CreateUserUseCase(super.repository);
}
