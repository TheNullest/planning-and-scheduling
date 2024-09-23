// What does the class depend on
// Answer -- [AuthenticationRepository]
// How can we create a fake version of the dependency
// Answer -- Use [Mocktail]
// How do we control what our dependencies do
// Answer -- Using the [Mocktail]'s APIs

import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/features/auth/domain/usecases/get_user_usecase.dart';

import '_authentication_repository.mock.dart';

void main() {
  late GetUserUsecase useCase;
  late AuthenticationRepository repository;
  late UserEntity param;
  setUp(() {
    repository = MockAuthRepo();
    useCase = GetUserUsecase(repository);
    param = UserEntity.empty();
  });

  test(
      '[user.getUsecase] must call the [AuthRepo.getUser] and return [UserEntity]',
      () async {
    //Arrange
    when(() => repository.getEntity(id: '1'))
        .thenAnswer((_) async => Right(param));

    // Act
    final result = await useCase('1');
    expect(result, equals(Right<Failure, UserEntity>(param)));
    verify(() => repository.getEntity(id: '1')).called(1);
    verifyNoMoreInteractions(repository);
  });
}
