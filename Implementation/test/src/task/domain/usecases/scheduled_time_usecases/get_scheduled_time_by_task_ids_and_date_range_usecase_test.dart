import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/features/task/domain/entities/scheduled_time_entity.dart';
import 'package:zamaan/features/task/domain/params/get_by_task_ids_and_date_range_params.dart';
import 'package:zamaan/features/task/domain/repositories/scheduled_time_repository.dart';
import 'package:zamaan/features/task/domain/usecases/scheduled_time_usecases/get_scheduled_time_by_task_ids_and_date_range_usecase.dart';

import '_scheduled_time_repository.mock.dart';

void main() {
  late GetScheduledTimeByTaskIdsAndDateRangeUsecase useCase;
  late ScheduledTimeRepository repository;
  setUp(() {
    repository = MockScheduledTimeRepo();
    useCase = GetScheduledTimeByTaskIdsAndDateRangeUsecase(repository);
  });

  final startAt = DateTime.now();
  final endAt = DateTime(2024, 10);
  final params = GetByTaskIdsAndDateRangeParams(
      mainTaskIds: ['1'], startAt: startAt, endAt: endAt);
  test(
      '[scheduledTime.GetScheduledTimeByTaskIdsAndDateRangeUsecase] must call the [ScheduledTimeRepository.getScheduledTimeByTaskIdsAndDateRange] and return [List<ScheduledTimeEntity>]',
      () async {
    //Arrange
    when(() => repository.getScheduledTimeByTaskIdsAndDateRange(
        ['1'], startAt, endAt)).thenAnswer((_) async => const Right([]));

    // Act
    final result = await useCase(params);

    // Assert
    expect(result, equals(const Right<dynamic, List<ScheduledTimeEntity>>([])));
    verify(() => repository.getScheduledTimeByTaskIdsAndDateRange(
        ['1'], startAt, endAt)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
