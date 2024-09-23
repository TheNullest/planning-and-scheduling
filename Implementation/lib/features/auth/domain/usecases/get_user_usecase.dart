import 'package:zamaan/core/usecases/get_entity_usecase.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

class GetUserUsecase
    extends GetEntityUseCase<AuthenticationRepository, UserEntity> {
  GetUserUsecase(super.repository);
}
