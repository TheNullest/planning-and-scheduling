import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';
import 'package:zamaan/features/task/domain/repositories/measurement_unit_repository.dart';
import 'package:zamaan/features/task/domain/usecases/measurement_unit_usecases/delete_measurement_unit_usecase.dart';

import '_measurement_unit_repository.mock.dart';

void main() {
  late DeleteMeasurementUnitUsecase useCase;
  late MeasurementUnitRepository repository;
  final params = GoalEntity.empty().id;
  setUp(() {
    repository = MockMeasurementUnitRepo();
    useCase = DeleteMeasurementUnitUsecase(repository);
  });

  test(
      '[measurementUnit.deleteUsecase] must call the [MeasurementUnitRepository.deleteEntity] and delete the entity then return the Right value',
      () async {
// Arrange
    when(() => repository.deleteEntity(id: params))
        .thenAnswer((_) async => const Right(null));

// Act
    final actual = await useCase(params);

// Assert
    expect(actual.isRight(), true);

    expect(actual, equals(const Right<Failure, void>(null)));
    verify(
      () => repository.deleteEntity(id: params),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });

  test(
      '[measurementUnit.deleteUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when deleteUsecase fails',
      () async {
// Arrange
    when(() => repository.deleteEntity(id: params))
        .thenAnswer((_) async => const Left(HiveFailure('Error')));

// Act
    final actual = await useCase(params);

// Assert
    expect(actual.isLeft(), true);
    expect(actual, equals(const Left(HiveFailure('Error'))));
    verify(
      () => repository.deleteEntity(id: params),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
