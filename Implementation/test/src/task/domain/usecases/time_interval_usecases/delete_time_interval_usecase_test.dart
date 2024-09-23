import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';
import 'package:zamaan/features/task/domain/usecases/time_interval_usecases/delete_time_interval_usecase.dart';

import '_time_interval_repository.mock.dart';

void main() {
  late DeleteTimeIntervalUsecase useCase;
  late TimeIntervalRepository repository;
  setUp(() {
    repository = MockTimeIntervalRepo();
    useCase = DeleteTimeIntervalUsecase(repository);
  });

  test(
      '[timeInterval.deleteUsecase] must call the [TimeIntervalRepository.deleteEntity] and delete the entity then return the Right value',
      () async {
// Arrange
    when(() => repository.deleteEntity(id: '1'))
        .thenAnswer((_) async => const Right(null));

// Act
    final actual = await useCase('1');

// Assert
    expect(actual.isRight(), true);

    expect(actual, equals(const Right<Failure, void>(null)));
    verify(
      () => repository.deleteEntity(id: '1'),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });

  test(
      '[timeInterval.deleteUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when deleteUsecase fails',
      () async {
// Arrange
    when(() => repository.deleteEntity(id: '1'))
        .thenAnswer((_) async => const Left(HiveFailure("Error")));

// Act
    final result = await useCase('1');

// Assert
    expect(result.isLeft(), true);
    expect(result, equals(const Left(HiveFailure("Error"))));
    verify(
      () => repository.deleteEntity(id: '1'),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
