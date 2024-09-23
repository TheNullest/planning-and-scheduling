import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';
import 'package:zamaan/features/task/domain/usecases/time_interval_usecases/delete_all_selected_time_intervals_usecase.dart';

import '_time_interval_repository.mock.dart';

void main() {
  late DeleteAllSelectedTimeIntervalsUsecase useCase;
  late TimeIntervalRepository repository;
  setUp(() {
    repository = MockTimeIntervalRepo();
    useCase = DeleteAllSelectedTimeIntervalsUsecase(repository);
  });

  test(
      '[timeInterval.deleteAllSelectedUsecase] must call the [TimeIntervalRepository.deleteAllSelected] and delete the entity then return the Right value',
      () async {
    // Arrange
    when(() => repository.deleteAllSelected([]))
        .thenAnswer((_) async => const Right(null));

    // Act
    final actual = await useCase([]);

    // Assert
    expect(actual, equals(const Right<Failure, void>(null)));
    verify(
      () => repository.deleteAllSelected([]),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
