import 'package:zamaan/core/usecases/delete_entities_usecase.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

class DeleteAllSelectedUsersUsecase
    extends DeleteEntitiesUseCase<AuthenticationRepository> {
  DeleteAllSelectedUsersUsecase(super.repository);
}
