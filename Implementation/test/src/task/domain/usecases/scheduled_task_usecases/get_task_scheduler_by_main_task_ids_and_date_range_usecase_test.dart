import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';
import 'package:zamaan/features/task/domain/params/get_by_task_ids_and_date_range_params.dart';
import 'package:zamaan/features/task/domain/repositories/task_scheduler_repository.dart';
import 'package:zamaan/features/task/domain/usecases/task_scheduler_usecases/get_task_scheduler_by_main_task_ids_and_date_range_usecase.dart';

import '_task_scheduler_repository.mock.dart';

void main() {
  late GetTaskSchedulerByTaskIdsAndDateRangeUsecase useCase;
  late TaskSchedulerRepository repository;
  setUp(() {
    repository = MockTaskSchedulerRepo();
    useCase = GetTaskSchedulerByTaskIdsAndDateRangeUsecase(repository);
  });

  final startAt = DateTime.now();
  final endAt = DateTime(2024, 10);
  final params = GetByTaskIdsAndDateRangeParams(
      mainTaskIds: ['1'], startAt: startAt, endAt: endAt);
  test(
      '[scheduledTime.GetScheduledTimeByTaskIdsAndDateRangeUsecase] must call the [ScheduledTimeRepository.getScheduledTimeByTaskIdsAndDateRange] and return [List<ScheduledTimeEntity>]',
      () async {
    //Arrange
    when(() => repository.getTaskSchedulerByMainTaskIdsAndDateRange(params))
        .thenAnswer((_) async => const Right([]));

    // Act
    final result = await useCase(params);

    // Assert
    expect(result.isRight(), true);

    expect(result, equals(const Right<dynamic, List<TaskSchedulerEntity>>([])));
    verify(() => repository.getTaskSchedulerByMainTaskIdsAndDateRange(params))
        .called(1);
    verifyNoMoreInteractions(repository);
  });

  test(
      '[scheduledTime.GetScheduledTimeByTaskIdsAndDateRangeUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when GetScheduledTimeByTaskIdsAndDateRangeUsecase fails',
      () async {
    //Arrange
    when(() => repository.getTaskSchedulerByMainTaskIdsAndDateRange(params))
        .thenAnswer((_) async => const Left(HiveFailure("Error")));

    // Act
    final result = await useCase(params);

    // Assert
    expect(result.isLeft(), true);
    expect(result, equals(const Left(HiveFailure("Error"))));
    verify(() => repository.getTaskSchedulerByMainTaskIdsAndDateRange(params))
        .called(1);
    verifyNoMoreInteractions(repository);
  });
}
