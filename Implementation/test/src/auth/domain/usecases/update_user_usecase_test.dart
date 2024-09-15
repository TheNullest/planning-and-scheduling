import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/auth/data/models/hive/hive_user_model.dart';
import 'package:zamaan/features/auth/domain/usecases/update_user_usecase.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'authentication_repository.mock.dart';

void main() {
  // Arrange
  late UpdateUserUseCase useCase;
  late AuthenticationRepository<HiveUserModel> repository;
  setUp(() {
    repository = MockAuthRepo();
    useCase = UpdateUserUseCase(repository);
  });

  UserEntity params = userModels[2];
  // Assert
  test('should update the [RemoteUserModel] with the right data', () async {
    //Arrange
    when(() => repository.updateEntity(entity: params))
        .thenAnswer((_) async => const Right(unit));
    // Act
    final actual = await useCase(params);

    // Assert
    expect(actual, equals(const Right<Failure, void>(unit)));
    verify(() => repository.updateEntity(entity: params)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test('should return failure when update fails', () async {
    // Arrange
    const failure = HiveFailure('Update failed');
    when(() => repository.updateEntity(entity: params))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await repository.updateEntity(entity: params);

    // Assert
    expect(result, isA<Left>());
    // or this
    expect(result, equals(const Left<Failure, void>(failure)));

    verify(() => repository.updateEntity(entity: params)).called(1);
  });
}
