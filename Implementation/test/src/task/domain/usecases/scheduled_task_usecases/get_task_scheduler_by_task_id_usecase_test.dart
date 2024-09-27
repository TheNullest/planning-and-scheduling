import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';
import 'package:zamaan/features/task/domain/repositories/task_scheduler_repository.dart';
import 'package:zamaan/features/task/domain/usecases/task_scheduler_usecases/get_task_scheduler_by_main_task_id_usecase.dart';

import '_task_scheduler_repository.mock.dart';

void main() {
  late GetTaskSchedulerByTaskIdUsecase useCase;
  late TaskSchedulerRepository repository;
  setUp(() {
    repository = MockTaskSchedulerRepo();
    useCase = GetTaskSchedulerByTaskIdUsecase(repository);
  });

  test(
      '[scheduledTime.GetScheduledTimeByTaskIdUsecase] must call the [ScheduledTimeRepository.getScheduledTimeByTaskId] and return [List<ScheduledTimeEntity>]',
      () async {
    //Arrange
    when(() => repository.getTaskSchedulersByMainTaskId('1'))
        .thenAnswer((_) async => const Right([]));

    // Act
    final result = await useCase('1');

    // Assert
    expect(result.isRight(), true);

    expect(result, equals(const Right<dynamic, List<TaskSchedulerEntity>>([])));
    verify(() => repository.getTaskSchedulersByMainTaskId('1')).called(1);
    verifyNoMoreInteractions(repository);
  });

  test(
      '[scheduledTime.GetScheduledTimeByTaskIdUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when GetScheduledTimeByTaskIdUsecase fails',
      () async {
    //Arrange
    when(() => repository.getTaskSchedulersByMainTaskId('1'))
        .thenAnswer((_) async => const Left(HiveFailure("Error")));

    // Act
    final result = await useCase('1');

    // Assert
    expect(result.isLeft(), true);
    expect(result, equals(const Left(HiveFailure("Error"))));
    verify(() => repository.getTaskSchedulersByMainTaskId('1')).called(1);
    verifyNoMoreInteractions(repository);
  });
}
