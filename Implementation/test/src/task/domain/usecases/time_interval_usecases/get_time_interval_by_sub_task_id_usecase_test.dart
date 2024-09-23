import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';
import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';
import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';
import 'package:zamaan/features/task/domain/usecases/time_interval_usecases/get_time_interval_by_sub_task_id_usecase.dart';

import '_time_interval_repository.mock.dart';

void main() {
  late GetTimeIntervalBySubTaskIdUsecase useCase;
  late TimeIntervalRepository repository;
  setUp(() {
    repository = MockTimeIntervalRepo();
    useCase = GetTimeIntervalBySubTaskIdUsecase(repository);
  });

  test(
      '[timeInterval.GetTimeIntervalBySubTaskIdUsecase] must call the [TimeIntervalRepository.getTimeIntervalBySubTaskId] and return [List<SubTaskEntity>]',
      () async {
    //Arrange
    when(() => repository.getTimeIntervalBySubTaskId('1'))
        .thenAnswer((_) async => const Right([]));

    // Act
    final result = await useCase('1');

    // Assert
    expect(result, equals(const Right<dynamic, List<TimeIntervalEntity>>([])));
    verify(() => repository.getTimeIntervalBySubTaskId('1')).called(1);
    verifyNoMoreInteractions(repository);
  });
}
