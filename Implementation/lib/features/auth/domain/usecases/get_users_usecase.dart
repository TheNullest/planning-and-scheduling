import 'package:zamaan/core/usecases/get_entities_usecase.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

class GetUsersUsecase
    extends GetEntitiesUseCase<AuthenticationRepository, UserEntity> {
  GetUsersUsecase(super.repository);
}
