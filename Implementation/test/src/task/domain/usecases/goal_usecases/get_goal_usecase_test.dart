import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
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
    expect(result, equals(Right<Failure, GoalEntity>(param)));
    verify(() => mockedRepo.getEntity(id: param.id)).called(1);
    verifyNoMoreInteractions(mockedRepo);
  });
}
