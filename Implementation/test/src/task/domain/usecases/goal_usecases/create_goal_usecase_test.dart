import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
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

  GoalEntity param = GoalEntity.empty();
  test('[goal.createUsecase] must call the [GoalRepository.createEntity]',
      () async {
    // Arrange
    // Act
    when(() => mockedRepository.createEntity(newEntity: param))
        .thenAnswer((_) async => const Right(null));
    var actualResult = await usecase(param);

    // Assert
    expect(actualResult, equals(const Right<Failure, void>(null)));
    verify(() => mockedRepository.createEntity(newEntity: param)).called(1);
    verifyNoMoreInteractions(mockedRepository);
  });
}
