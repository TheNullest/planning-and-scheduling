import 'package:zamaan/core/usecases/update_entity_usecase.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

class UpdateUserUseCase
    extends UpdateEntityUseCase<AuthenticationRepository, UserEntity> {
  UpdateUserUseCase(super.repository);
}
