import 'package:zamaan/core/common/entities/user_entity.dart';
import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/domain/repositories/authentication_repository.dart';

class CurrentUserUsecase
    extends UseCaseWithoutParams<AuthenticationRepository, UserEntity> {
  CurrentUserUsecase(super.repository);

  @override
  ResultFuture<UserEntity> call() async => repository.getCurrentUser();
}
