import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/features/task/domain/repositories/goal_repository.dart';
import 'package:zamaan/features/task/domain/usecases/goal_usecases/delete_all_selected_goals_usecase.dart';

import '_goal_repository.mock.dart';

void main() {
  late DeleteAllSelectedGoalsUsecase useCase;
  late GoalRepository repository;
  setUp(() {
    repository = MockGoalRepo();
    useCase = DeleteAllSelectedGoalsUsecase(repository);
  });

  test(
      '[goal.deleteAllSelectedUsecase] must call the [GoalRepository.deleteAllSelected] and delete the entity then return the Right value',
      () async {
    // Arrange
    when(() => repository.deleteAllSelected([]))
        .thenAnswer((_) async => const Right(null));

    // Act
    final actual = await useCase([]);

    // Assert
    expect(actual, equals(const Right<Failure, void>(null)));
    verify(
      () => repository.deleteAllSelected([]),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
