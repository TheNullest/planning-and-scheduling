import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';
import 'package:zamaan/features/task/domain/repositories/task_scheduler_repository.dart';
import 'package:zamaan/features/task/domain/usecases/task_scheduler_usecases/get_task_scheduler_usecase.dart';

import '_task_scheduler_repository.mock.dart';

void main() {
  late TaskSchedulerRepository mockedRepo;
  late GetTaskSchedulerUsecase usecase;
  late TaskSchedulerEntity param;

  setUp(() {
    mockedRepo = MockTaskSchedulerRepo();
    usecase = GetTaskSchedulerUsecase(mockedRepo);
    param = TaskSchedulerEntity.empty();
  });

  test(
      '[scheduledTime.getUsecase] must call the [ScheduledTimeRepository.getEntity] and return [ScheduledTimeEntity]',
      () async {
    //Arrange
    when(() => mockedRepo.getEntity(id: param.id))
        .thenAnswer((_) async => Right(param));

    // Act
    final result = await usecase(param.id);

    expect(result.isRight(), true);

    expect(result, equals(Right<Failure, TaskSchedulerEntity>(param)));
    verify(() => mockedRepo.getEntity(id: param.id)).called(1);
    verifyNoMoreInteractions(mockedRepo);
  });

  test(
      '[scheduledTime.getUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when getUsecase fails',
      () async {
    //Arrange
    when(() => mockedRepo.getEntity(id: param.id))
        .thenAnswer((_) async => const Left(HiveFailure('Error')));

    // Act
    final result = await usecase(param.id);
    expect(result.isLeft(), true);
    expect(result, equals(const Left(HiveFailure('Error'))));
    verify(() => mockedRepo.getEntity(id: param.id)).called(1);
    verifyNoMoreInteractions(mockedRepo);
  });
}
