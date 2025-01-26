import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';
import 'package:zamaan/features/task/domain/repositories/task_scheduler_repository.dart';
import 'package:zamaan/features/task/domain/usecases/task_scheduler_usecases/update_task_scheduler_usecase.dart';

import '_task_scheduler_repository.mock.dart';

void main() {
  // Arrange
  late UpdateTaskSchedulerUsecase useCase;
  late TaskSchedulerRepository repository;
  setUp(() {
    repository = MockTaskSchedulerRepo();
    useCase = UpdateTaskSchedulerUsecase(repository);
  });

  final params = TaskSchedulerEntity.empty();
  // Assert
  test(
      '[scheduledTime.updateUsecase] must call the [GoalRepository.updateEntity] and update the [ScheduledTimeModel] with the right data',
      () async {
    //Arrange
    when(() => repository.updateEntity(entity: params))
        .thenAnswer((_) async => const Right(null));
    // Act
    final actual = await useCase(params);

    // Assert
    expect(actual, equals(const Right<Failure, void>(null)));
    verify(() => repository.updateEntity(entity: params)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test(
      '[scheduledTime.updateUsecase.failureTest] must return failure when update fails',
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
