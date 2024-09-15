// What does the class depend on
// Answer -- [AuthenticationRepository]
// How can we create a fake version of the dependency
// Answer -- Use [Mocktail]
// How do we control what our dependencies do
// Answer -- Using the [Mocktail]'s APIs

import 'package:zamaan/features/auth/data/models/hive/hive_user_model.dart';
import 'package:zamaan/features/auth/domain/usecases/get_users_usecase.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'authentication_repository.mock.dart';

void main() {
  late GetUsersUsecase useCase;
  late AuthenticationRepository<HiveUserModel> repository;

  setUp(() {
    repository = MockAuthRepo();
    useCase = GetUsersUsecase(repository);
  });

  test('should call the [AuthRepo.getUsers] and return [List<UserEntity>]',
      () async {
    //Arrange
    when(() => repository.getEntities())
        .thenAnswer((_) async => Right(userModels));

    // Act
    final result = await useCase();
    expect(result, equals(Right<dynamic, List<UserEntity>>(userModels)));
    verify(() => repository.getEntities()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
