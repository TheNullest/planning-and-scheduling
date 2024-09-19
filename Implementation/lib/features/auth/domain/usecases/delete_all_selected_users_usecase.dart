import 'package:zamaan/core/usecases/usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/domain/repositories/hive/authentication_repository.dart';

class DeleteAllSelectedUsersUsecase
    extends UseCaseWithParams<AuthenticationRepository, void, List<String>> {
  DeleteAllSelectedUsersUsecase(super.repository);

  @override
  ResultFutureVoid call(List<String> params) async =>
      await repository.deleteAllSelected(params);
}
