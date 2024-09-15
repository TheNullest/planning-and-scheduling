// What does the class depend on
// Answer -- [AuthenticationRepository]
// How can we create a fake version of the dependency
// Answer -- Use [Mocktail]
// How do we control what our dependencies do
// Answer -- Using the [Mocktail]'s APIs

import 'package:zamaan/features/auth/data/models/hive/hive_user_model.dart';
import 'package:zamaan/features/auth/domain/usecases/get_user_usecase.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'authentication_repository.mock.dart';

void main() {
  late GetUserUsecase useCase;
  late AuthenticationRepository<HiveUserModel> repository;
  setUp(() {
    repository = MockAuthRepo();
    useCase = GetUserUsecase(repository);
  });

  test('should call the [AuthRepo.getUser] and return [UserEntity]', () async {
    //Arrange
    when(() => repository.getEntity(id: '1'))
        .thenAnswer((_) async => Right(userModels[0]));

    // Act
    final result = await useCase('1');
    expect(result, equals(Right<dynamic, UserEntity>(userModels[0])));
    verify(() => repository.getEntity(id: '1')).called(1);
    verifyNoMoreInteractions(repository);
  });
}
