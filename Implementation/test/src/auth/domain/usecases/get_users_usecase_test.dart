// What does the class depend on
// Answer -- [AuthenticationRepository]
// How can we create a fake version of the dependency
// Answer -- Use [Mocktail]
// How do we control what our dependencies do
// Answer -- Using the [Mocktail]'s APIs

import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/auth/data/models/local/hive/hive_user_model.dart';
import 'package:zamaan/features/auth/domain/usecases/get_users_usecase.dart';

import '_authentication_repository.mock.dart';

void main() {
  late GetUsersUsecase useCase;
  late AuthenticationRepository repository;
  late List<HiveUserModel> entities;
  setUp(() {
    repository = MockAuthRepo();
    useCase = GetUsersUsecase(repository);
    entities = [];
  });

  test(
      '[user.getAllUsecase] must call the [AuthRepo.getUsers] and return [List<UserEntity>]',
      () async {
    //Arrange
    when(() => repository.getEntities())
        .thenAnswer((_) async => Right(entities));

    // Act
    final result = await useCase();

    // Assert
    expect(result.isRight(), true);
    expect(result, equals(Right<dynamic, List<UserEntity>>(entities)));
    verify(() => repository.getEntities()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test(
      '[user.getAllUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when getAllUsecase fails',
      () async {
    //Arrange
    when(() => repository.getEntities())
        .thenAnswer((_) async => const Left(HiveFailure("Error")));

    // Act
    final result = await useCase();

    // Assert
    expect(result.isLeft(), true);
    expect(result,
        equals(const Left<dynamic, List<UserEntity>>(HiveFailure("Error"))));
    verify(() => repository.getEntities()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
