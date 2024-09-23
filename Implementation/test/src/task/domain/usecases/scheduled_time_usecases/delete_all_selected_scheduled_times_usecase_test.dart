import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/repositories/scheduled_time_repository.dart';
import 'package:zamaan/features/task/domain/usecases/scheduled_time_usecases/delete_all_selected_scheduled_times_usecase.dart';

import '_scheduled_time_repository.mock.dart';

void main() {
  late DeleteAllSelectedScheduledTimesUsecase useCase;
  late ScheduledTimeRepository repository;
  setUp(() {
    repository = MockScheduledTimeRepo();
    useCase = DeleteAllSelectedScheduledTimesUsecase(repository);
  });

  test(
      '[scheduledTime.deleteAllSelectedUsecase] must call the [ScheduledTimeRepository.deleteAllSelected] and delete the entity then return the Right value',
      () async {
    // Arrange
    when(() => repository.deleteAllSelected([]))
        .thenAnswer((_) async => const Right(null));

    // Act
    final actual = await useCase([]);

    // Assert
    expect(actual.isRight(), true);

    expect(actual, equals(const Right<Failure, void>(null)));
    verify(
      () => repository.deleteAllSelected([]),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });

  test(
      '[scheduledTime.deleteAllSelectedUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when deleteAllSelectedUsecase fails',
      () async {
    // Arrange
    when(() => repository.deleteAllSelected([]))
        .thenAnswer((_) async => const Left(HiveFailure("Error")));

    // Act
    final actual = await useCase([]);

    // Assert
    expect(actual.isLeft(), true);
    expect(actual, equals(const Left(HiveFailure("Error"))));
    verify(
      () => repository.deleteAllSelected([]),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
