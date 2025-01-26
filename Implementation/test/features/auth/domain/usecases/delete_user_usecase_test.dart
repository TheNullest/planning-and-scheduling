import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/auth/domain/usecases/delete_user_usecase.dart';

import '../../../../fixtures/fixture_reader.dart';
import '_authentication_repository.mock.dart';

void main() {
  late DeleteUserUseCase useCase;
  late AuthenticationRepository repository;
  final params = getHiveUserModels()[2].id;
  setUp(() {
    repository = MockAuthRepo();
    useCase = DeleteUserUseCase(repository);
  });

  group('user.deleteUsecase', () {
    test(
        '[user.deleteUsecase] must call the [AuthRepo.deleteEntity] and delete the entity then return the Right value',
        () async {
      // Arrange
      when(() => repository.deleteEntity(id: params))
          .thenAnswer((_) async => const Right(null));

      // Act
      final actual = await useCase(params);

      // Assert
      expect(actual.isRight(), true);
      expect(actual, equals(const Right<Failure, void>(null)));
      verify(
        () => repository.deleteEntity(id: params),
      ).called(1);
      verifyNoMoreInteractions(repository);
    });

    test(
        '[user.deleteUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when deleteUsecase fails',
        () async {
      // Arrange
      when(() => repository.deleteEntity(id: params))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      // Act
      final actual = await useCase(params);

      // Assert
      expect(actual.isLeft(), true);
      expect(actual, equals(const Left<Failure, void>(HiveFailure('Error'))));
      verify(
        () => repository.deleteEntity(id: params),
      ).called(1);
      verifyNoMoreInteractions(repository);
    });
  });
}
