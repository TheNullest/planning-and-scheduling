import 'package:zamaan/core/usecases/delete_entity_usecase.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

class DeleteUserUseCase extends DeleteEntityUseCase<AuthenticationRepository> {
  DeleteUserUseCase(super.repository);
}
