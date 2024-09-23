import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/features/task/domain/entities/scheduled_time_entity.dart';
import 'package:zamaan/features/task/domain/repositories/scheduled_time_repository.dart';
import 'package:zamaan/features/task/domain/usecases/scheduled_time_usecases/get_scheduled_times_usecase.dart';

import '_scheduled_time_repository.mock.dart';

void main() {
  late GetScheduledTimesUsecase useCase;
  late ScheduledTimeRepository repository;
  setUp(() {
    repository = MockScheduledTimeRepo();
    useCase = GetScheduledTimesUsecase(repository);
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
    expect(result, equals(const Right<dynamic, List<ScheduledTimeEntity>>([])));
    verify(() => repository.getEntities()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
