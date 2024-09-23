import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';
import 'package:zamaan/features/task/domain/usecases/main_task_usecases/update_main_task_usecase.dart';

import '_main_task_repository.mock.dart';

void main() {
  // Arrange
  late UpdateMainTaskUseCase useCase;
  late MainTaskRepository repository;
  setUp(() {
    repository = MockMainTaskRepo();
    useCase = UpdateMainTaskUseCase(repository);
  });

  MainTaskEntity params = MainTaskEntity.empty();
  // Assert
  test(
      '[mainTask.updateUsecase] must call the [MainTaskRepository.updateEntity] and update the [MainTaskModel] with the right data',
      () async {
    //Arrange
    when(() => repository.updateEntity(entity: params))
        .thenAnswer((_) async => const Right(null));
    // Act
    final actual = await useCase(params);

    // Assert
    expect(actual, isA<Right>());
    expect(actual, equals(const Right<Failure, void>(null)));
    verify(() => repository.updateEntity(entity: params)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test(
      '[mainTask.updateUsecase.failureTest] must return failure when update fails',
      () async {
    // Arrange
    const failure = HiveFailure('Update failed');
    when(() => repository.updateEntity(entity: params))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await repository.updateEntity(entity: params);

    // Assert
    expect(result, isA<Left>());
    expect(result, equals(const Left<Failure, void>(failure)));

    verify(() => repository.updateEntity(entity: params)).called(1);
  });
}
