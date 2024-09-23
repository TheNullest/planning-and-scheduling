import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';
import 'package:zamaan/features/task/domain/repositories/goal_repository.dart';
import 'package:zamaan/features/task/domain/usecases/goal_usecases/delete_goal_usecase.dart';

import '_goal_repository.mock.dart';

void main() {
  late DeleteGoalUsecase useCase;
  late GoalRepository repository;
  String params = GoalEntity.empty().id;
  setUp(() {
    repository = MockGoalRepo();
    useCase = DeleteGoalUsecase(repository);
  });

  test(
      '[goal.deleteUsecase] must call the [GoalRepository.deleteEntity] and delete the entity then return the Right value',
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
      '[goal.deleteUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when deleteUsecase fails',
      () async {
    // Arrange
    when(() => repository.deleteEntity(id: params))
        .thenAnswer((_) async => const Left(HiveFailure("Error")));

    // Act
    final actual = await useCase(params);

    // Assert
    expect(actual.isLeft(), true);

    expect(actual, equals(const Left(HiveFailure("Error"))));
    verify(
      () => repository.deleteEntity(id: params),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
