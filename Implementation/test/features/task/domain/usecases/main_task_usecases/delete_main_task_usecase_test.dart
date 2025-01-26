import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';
import 'package:zamaan/features/task/domain/usecases/main_task_usecases/delete_main_task_usecase.dart';

import '_main_task_repository.mock.dart';

void main() {
  late DeleteMainTaskUseCase useCase;
  late MainTaskRepository repository;
  final params = GoalEntity.empty().id;
  setUp(() {
    repository = MockMainTaskRepo();
    useCase = DeleteMainTaskUseCase(repository);
  });

  test(
      '[mainTask.deleteUsecase] must call the [MainTaskRepository.deleteEntity] and delete the entity then return the Right value',
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
      '[mainTask.deleteUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when deleteUsecase fails',
      () async {
// Arrange
    when(() => repository.deleteEntity(id: params))
        .thenAnswer((_) async => const Left(HiveFailure('Error')));

// Act
    final actual = await useCase(params);

// Assert
    expect(actual.isLeft(), true);

    expect(actual, equals(const Left(HiveFailure('Error'))));
    verify(
      () => repository.deleteEntity(id: params),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
