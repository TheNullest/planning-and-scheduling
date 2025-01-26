import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/domain/repositories/authentication_repository.dart';

class SignOutUsecase
    extends UseCaseWithoutParams<AuthenticationRepository, void> {
  SignOutUsecase(super.repository);

  @override
  ResultFutureVoid call() async => repository.signOut();
}
