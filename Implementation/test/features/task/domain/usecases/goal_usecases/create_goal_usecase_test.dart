import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';
import 'package:zamaan/features/task/domain/repositories/goal_repository.dart';
import 'package:zamaan/features/task/domain/usecases/goal_usecases/create_goal_usecase.dart';

import '_goal_repository.mock.dart';

void main() {
  late CreateGoalUsecase usecase;
  late GoalRepository mockedRepository;

  setUp(() {
    mockedRepository = MockGoalRepo();
    usecase = CreateGoalUsecase(mockedRepository);
  });

  final param = GoalEntity.empty();
  test('[goal.createUsecase] must call the [GoalRepository.createEntity]',
      () async {
    // Arrange
    // Act
    when(() => mockedRepository.createEntity(newEntity: param))
        .thenAnswer((_) async => const Right(null));
    final actualResult = await usecase(param);

    // Assert
    expect(actualResult.isRight(), true);
    expect(actualResult, equals(const Right<Failure, void>(null)));
    verify(() => mockedRepository.createEntity(newEntity: param)).called(1);
    verifyNoMoreInteractions(mockedRepository);
  });

  test(
      '[goal.createUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when createUsecase fails',
      () async {
    // Arrange
    // Act
    when(() => mockedRepository.createEntity(newEntity: param))
        .thenAnswer((_) async => const Left(HiveFailure('Error')));
    final actualResult = await usecase(param);

    // Assert
    expect(actualResult.isLeft(), true);
    expect(actualResult, equals(const Left(HiveFailure('Error'))));
    verify(() => mockedRepository.createEntity(newEntity: param)).called(1);
    verifyNoMoreInteractions(mockedRepository);
  });
}
