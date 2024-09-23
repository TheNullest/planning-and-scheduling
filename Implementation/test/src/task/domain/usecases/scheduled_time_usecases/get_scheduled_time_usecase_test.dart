import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/scheduled_time_entity.dart';
import 'package:zamaan/features/task/domain/repositories/scheduled_time_repository.dart';
import 'package:zamaan/features/task/domain/usecases/scheduled_time_usecases/get_scheduled_time_usecase.dart';

import '_scheduled_time_repository.mock.dart';

void main() {
  late ScheduledTimeRepository mockedRepo;
  late GetScheduledTimeUsecase usecase;
  late ScheduledTimeEntity param;

  setUp(() {
    mockedRepo = MockScheduledTimeRepo();
    usecase = GetScheduledTimeUsecase(mockedRepo);
    param = ScheduledTimeEntity.empty();
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

    expect(result, equals(Right<Failure, ScheduledTimeEntity>(param)));
    verify(() => mockedRepo.getEntity(id: param.id)).called(1);
    verifyNoMoreInteractions(mockedRepo);
  });

  test(
      '[scheduledTime.getUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when getUsecase fails',
      () async {
    //Arrange
    when(() => mockedRepo.getEntity(id: param.id))
        .thenAnswer((_) async => const Left(HiveFailure("Error")));

    // Act
    final result = await usecase(param.id);
    expect(result.isLeft(), true);
    expect(result, equals(const Left(HiveFailure("Error"))));
    verify(() => mockedRepo.getEntity(id: param.id)).called(1);
    verifyNoMoreInteractions(mockedRepo);
  });
}
