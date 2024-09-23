import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';
import 'package:zamaan/features/task/domain/repositories/goal_repository.dart';
import 'package:zamaan/features/task/domain/usecases/goal_usecases/get_goals_usecase.dart';

import '_goal_repository.mock.dart';

void main() {
  late GetGoalsUsecase useCase;
  late GoalRepository repository;
  setUp(() {
    repository = MockGoalRepo();
    useCase = GetGoalsUsecase(repository);
  });

  test(
      '[goal.getAllUsecase] must call the [GoalRepository.getEntities] and return [List<GoalEntity>]',
      () async {
    //Arrange
    when(() => repository.getEntities())
        .thenAnswer((_) async => const Right([]));

    // Act
    final result = await useCase();

    // Assert
    expect(result, equals(const Right<dynamic, List<GoalEntity>>([])));
    verify(() => repository.getEntities()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
