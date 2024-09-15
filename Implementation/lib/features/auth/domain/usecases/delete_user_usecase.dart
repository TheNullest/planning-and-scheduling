import 'package:zamaan/core/usecases/usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

class DeleteUserUseCase
    extends UseCaseWithParams<AuthenticationRepository, void, String> {
  DeleteUserUseCase(super.repository);

  @override
  ResultFutureVoid call(String params) async =>
      await repository.deleteEntity(id: params);
}
