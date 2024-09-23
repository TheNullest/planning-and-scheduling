import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/features/task/domain/entities/measurement_unit_entity.dart';
import 'package:zamaan/features/task/domain/repositories/measurement_unit_repository.dart';
import 'package:zamaan/features/task/domain/usecases/measurement_unit_usecases/create_measurement_unit_usecase.dart';

import '_measurement_unit_repository.mock.dart';

void main() {
  late CreateMeasurementUnitUsecase usecase;
  late MeasurementUnitRepository mockedRepository;

  setUp(() {
    mockedRepository = MockMeasurementUnitRepo();
    usecase = CreateMeasurementUnitUsecase(mockedRepository);
  });

  MeasurementUnitEntity param = MeasurementUnitEntity.empty();
  test(
      '[measurementUnit.createUsecase] must call the [MeasurementUnitRepository.createEntity]',
      () async {
    // Arrange
    // Act
    when(() => mockedRepository.createEntity(newEntity: param))
        .thenAnswer((_) async => const Right(null));
    var actualResult = await usecase(param);

    // Assert
    expect(actualResult, equals(const Right<Failure, void>(null)));
    verify(() => mockedRepository.createEntity(newEntity: param)).called(1);
    verifyNoMoreInteractions(mockedRepository);
  });
}
