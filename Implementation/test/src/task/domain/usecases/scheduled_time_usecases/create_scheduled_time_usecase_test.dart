import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/features/task/domain/entities/scheduled_time_entity.dart';
import 'package:zamaan/features/task/domain/repositories/scheduled_time_repository.dart';
import 'package:zamaan/features/task/domain/usecases/scheduled_time_usecases/create_scheduled_time_usecase.dart';

import '_scheduled_time_repository.mock.dart';

void main() {
  late CreateScheduledTimeUsecase usecase;
  late ScheduledTimeRepository mockedRepository;

  setUp(() {
    mockedRepository = MockScheduledTimeRepo();
    usecase = CreateScheduledTimeUsecase(mockedRepository);
  });

  ScheduledTimeEntity param = ScheduledTimeEntity.empty();
  test(
      '[scheduledTime.createUsecase] must call the [ScheduledTimeRepository.createEntity]',
      () async {
    // Arrange
    // Act
    when(() => mockedRepository.createEntity(newEntity: param))
        .thenAnswer((_) async => const Right(null));
    var actualResult = await usecase(param);

    // Assert
    expect(actualResult, equals(const Right<Failure, void>(null)));
    verify(() => mockedRepository.createEntity(newEntity: param)).called(1);
    verifyNoMoreInteractions(mockedRepository);
  });
}
