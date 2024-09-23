import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/features/auth/domain/usecases/delete_all_selected_users_usecase.dart';

import '_authentication_repository.mock.dart';

void main() {
  late DeleteAllSelectedUsersUsecase useCase;
  late AuthenticationRepository repository;
  setUp(() {
    repository = MockAuthRepo();
    useCase = DeleteAllSelectedUsersUsecase(repository);
  });

  test(
      '[user.deleteAllSelectedUsecase] must call the [AuthRepo.deleteAllSelected] and delete the entity then return the Right value',
      () async {
    // Arrange
    when(() => repository.deleteAllSelected([]))
        .thenAnswer((_) async => const Right(null));

    // Act
    final actual = await useCase([]);

    // Assert
    expect(actual, equals(const Right<Failure, void>(null)));
    verify(
      () => repository.deleteAllSelected([]),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
