import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';
import 'package:zamaan/features/task/domain/repositories/task_scheduler_repository.dart';
import 'package:zamaan/features/task/domain/usecases/task_scheduler_usecases/get_task_schedulers_usecase.dart';

import '_task_scheduler_repository.mock.dart';

void main() {
  late GetTaskSchedulersUsecase useCase;
  late TaskSchedulerRepository repository;
  setUp(() {
    repository = MockTaskSchedulerRepo();
    useCase = GetTaskSchedulersUsecase(repository);
  });

  test(
      '[scheduledTime.getAllUsecase] must call the [ScheduledTimeRepository.getEntities] and return [List<ScheduledTimeEntity>]',
      () async {
    //Arrange
    when(() => repository.getEntities())
        .thenAnswer((_) async => const Right([]));

    // Act
    final result = await useCase();

    // Assert
    expect(result.isRight(), true);

    expect(result, equals(const Right<dynamic, List<TaskSchedulerEntity>>([])));
    verify(() => repository.getEntities()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test(
      '[scheduledTime.getAllUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when getAllUsecase fails',
      () async {
    //Arrange
    when(() => repository.getEntities())
        .thenAnswer((_) async => const Left(HiveFailure('Error')));

    // Act
    final result = await useCase();

    // Assert
    expect(result.isLeft(), true);
    expect(result, equals(const Left(HiveFailure('Error'))));
    verify(() => repository.getEntities()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
