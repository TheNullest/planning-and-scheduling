import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/features/task/domain/repositories/measurement_unit_repository.dart';
import 'package:zamaan/features/task/domain/usecases/measurement_unit_usecases/delete_all_selected_measurement_units_usecase.dart';

import '_measurement_unit_repository.mock.dart';

void main() {
  late DeleteAllSelectedMeasurementUnitsUsecase useCase;
  late MeasurementUnitRepository repository;
  setUp(() {
    repository = MockMeasurementUnitRepo();
    useCase = DeleteAllSelectedMeasurementUnitsUsecase(repository);
  });

  test(
      '[measurementUnit.deleteAllSelectedUsecase] must call the [MeasurementUnitRepository.deleteAllSelected] and delete the entity then return the Right value',
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
