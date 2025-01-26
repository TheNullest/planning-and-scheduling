// ignore_for_file: void_checks

import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/auth/domain/usecases/create_user_usecase.dart';

import '_authentication_repository.mock.dart';

// What does the class depend on
// Answer -- [AuthenticationRepository]
// How can we create a fake version of the dependency
// Answer -- Use [Mocktail]
// How do we control what our dependencies do
// Answer -- Using the [Mocktail]'s APIs
void main() {
  late CreateUserUseCase useCase;
  late AuthenticationRepository repository;

  setUpAll(() {
    registerFallbackValue(FakeUserEntity());
  });

  setUp(() {
    repository = MockAuthRepo();
    useCase = CreateUserUseCase(repository);
  });

  final params = UserEntity.empty();
  group('user.createUsecase', () {
    test('[user.createUsecase] must call the [AuthRepo.createEntity]',
        () async {
      // Arrange
      // STUB
      when(
        () => repository.createEntity(
          newEntity: any(named: 'newEntity'),
        ),
      ).thenAnswer((_) async => const Right(true));

      // Act
      final actual = await useCase(params);

      // Assert
      expect(actual.isRight(), true);
      expect(actual, equals(const Right<Failure, bool>(true)));
      verify(
        () => repository.createEntity(newEntity: params),
      ).called(1);

      verifyNoMoreInteractions(repository);
    });

    test(
        '[user.createUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when createUsecase fails',
        () async {
      // Arrange
      // STUB
      when(
        () => repository.createEntity(
          newEntity: any(named: 'newEntity'),
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      // Act
      final actual = await useCase(params);

      // Assert
      expect(actual.isLeft(), true);
      expect(actual, equals(const Left<Failure, bool>(HiveFailure('Error'))));
      verify(
        () => repository.createEntity(newEntity: params),
      ).called(1);

      verifyNoMoreInteractions(repository);
    });
  });
}
