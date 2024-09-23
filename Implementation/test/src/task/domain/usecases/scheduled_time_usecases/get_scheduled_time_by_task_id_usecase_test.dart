import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
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
    expect(result, equals(const Right<dynamic, List<ScheduledTimeEntity>>([])));
    verify(() => repository.getScheduledTimeByTaskId('1')).called(1);
    verifyNoMoreInteractions(repository);
  });
}
