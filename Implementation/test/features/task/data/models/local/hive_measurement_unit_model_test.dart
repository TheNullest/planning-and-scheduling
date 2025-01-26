import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';
import 'package:zamaan/features/task/data/models/local/measurement_unit_local_model.dart';
import 'package:zamaan/features/task/domain/entities/measurement_unit_entity.dart';

void main() {
  final entity = MeasurementUnitEntity.empty();
  final testModel = MeasurementUnitLocalModel.fromEntity(entity);
  test(
      '[hiveMeasurementUnitModel] must be a subclass of [MeasurementUnitEntity] ',
      () {
    // Arrange => testModel

    // Assert
    expect(testModel, isA<MeasurementUnitEntity>());
    expect(testModel, isA<BaseEntityAbstraction>());
  });

  group('hiveMeasurementUnitModel', () {
    test(
        '[hiveMeasurementUnitModel.toEntity] must return a [MeasurementUnitEntity] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = testModel.toEntity();
      // Assert
      expect(actual, equals(entity));
    });

    test(
        '[hiveMeasurementUnitModel.fromEntity] must return a [MeasurementUnitLocalModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = MeasurementUnitLocalModel.fromEntity(entity);
      // Assert
      expect(actual, testModel);
    });

    test(
        '[hiveMeasurementUnitModel.copyWith] must return a customed [RemoteUserModel]with the right data',
        () {
      // Arrange

      // Act
      final actual = testModel.copyWith(description: 'Something');

      // Assert
      expect(actual.description, equals('Something'));
      expect(actual, isNot(testModel));
    });
  });
}
