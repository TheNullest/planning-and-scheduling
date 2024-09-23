import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/scheduled_time_entity.dart';
import 'package:zamaan/features/task/domain/repositories/scheduled_time_repository.dart';
import 'package:zamaan/features/task/domain/usecases/scheduled_time_usecases/get_scheduled_time_by_task_id_usecase.dart';

import '_scheduled_time_repository.mock.dart';

void main() {
  late GetScheduledTimeByTaskIdUsecase useCase;
  late ScheduledTimeRepository repository;
  setUp(() {
    repository = MockScheduledTimeRepo();
    useCase = GetScheduledTimeByTaskIdUsecase(repository);
  });

  test(
      '[scheduledTime.GetScheduledTimeByTaskIdUsecase] must call the [ScheduledTimeRepository.getScheduledTimeByTaskId] and return [List<ScheduledTimeEntity>]',
      () async {
    //Arrange
    when(() => repository.getScheduledTimeByTaskId('1'))
        .thenAnswer((_) async => const Right([]));

    // Act
    final result = await useCase('1');

    // Assert
    expect(result.isRight(), true);

    expect(result, equals(const Right<dynamic, List<ScheduledTimeEntity>>([])));
    verify(() => repository.getScheduledTimeByTaskId('1')).called(1);
    verifyNoMoreInteractions(repository);
  });

  test(
      '[scheduledTime.GetScheduledTimeByTaskIdUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when GetScheduledTimeByTaskIdUsecase fails',
      () async {
    //Arrange
    when(() => repository.getScheduledTimeByTaskId('1'))
        .thenAnswer((_) async => const Left(HiveFailure("Error")));

    // Act
    final result = await useCase('1');

    // Assert
    expect(result.isLeft(), true);
    expect(result, equals(const Left(HiveFailure("Error"))));
    verify(() => repository.getScheduledTimeByTaskId('1')).called(1);
    verifyNoMoreInteractions(repository);
  });
}
