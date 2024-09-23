import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/features/task/domain/entities/measurement_unit_entity.dart';
import 'package:zamaan/features/task/domain/repositories/measurement_unit_repository.dart';
import 'package:zamaan/features/task/domain/usecases/measurement_unit_usecases/get_measurement_units_usecase.dart';

import '_measurement_unit_repository.mock.dart';

void main() {
  late GetMeasurementUnitsUsecase useCase;
  late MeasurementUnitRepository repository;
  setUp(() {
    repository = MockMeasurementUnitRepo();
    useCase = GetMeasurementUnitsUsecase(repository);
  });

  test(
      '[measurementUnit.getAllUsecase] must call the [MeasurementUnitRepository.getEntities] and return [List<MeasurementUnitEntity>]',
      () async {
    //Arrange
    when(() => repository.getEntities())
        .thenAnswer((_) async => const Right([]));

    // Act
    final result = await useCase();

    // Assert
    expect(
        result, equals(const Right<dynamic, List<MeasurementUnitEntity>>([])));
    verify(() => repository.getEntities()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
