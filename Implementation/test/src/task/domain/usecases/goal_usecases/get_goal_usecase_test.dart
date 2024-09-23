import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';
import 'package:zamaan/features/task/domain/repositories/goal_repository.dart';
import 'package:zamaan/features/task/domain/usecases/goal_usecases/get_goal_usecase.dart';

import '_goal_repository.mock.dart';

void main() {
  late GoalRepository mockedRepo;
  late GetGoalUsecase usecase;
  late GoalEntity param;

  setUp(() {
    mockedRepo = MockGoalRepo();
    usecase = GetGoalUsecase(mockedRepo);
    param = GoalEntity.empty();
  });

  test(
      '[goal.getUsecase] must call the [GoalRepository.getEntity] and return [GoalEntity]',
      () async {
    //Arrange
    when(() => mockedRepo.getEntity(id: param.id))
        .thenAnswer((_) async => Right(param));

    // Act
    final result = await usecase(param.id);

    //Assert
    expect(result.isRight(), true);

    expect(result, equals(Right<Failure, GoalEntity>(param)));
    verify(() => mockedRepo.getEntity(id: param.id)).called(1);
    verifyNoMoreInteractions(mockedRepo);
  });

  test(
      '[goal.getUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when getUsecase fails',
      () async {
    //Arrange
    when(() => mockedRepo.getEntity(id: param.id))
        .thenAnswer((_) async => const Left(HiveFailure("Error")));

    // Act
    final result = await usecase(param.id);

    // Assert
    expect(result.isLeft(), true);

    expect(result, equals(const Left(HiveFailure("Error"))));
    verify(() => mockedRepo.getEntity(id: param.id)).called(1);
    verifyNoMoreInteractions(mockedRepo);
  });
}
