import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/features/task/data/models/local/hive_measurement_unit_model.dart';
import 'package:zamaan/features/task/domain/entities/measurement_unit_entity.dart';

void main() {
  final MeasurementUnitEntity entity = MeasurementUnitEntity.empty();
  final HiveMeasurementUnitModel testModel =
      HiveMeasurementUnitModel.fromEntity(entity);
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
        '[hiveMeasurementUnitModel.fromEntity] must return a [HiveMeasurementUnitModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = HiveMeasurementUnitModel.fromEntity(entity);
      // Assert
      expect(actual, testModel);
    });

    test(
        '[hiveMeasurementUnitModel.copyWith] must return a customed [RemoteUserModel]with the right data',
        () {
      // Arrange

      // Act
      final actual = testModel.copyWith(order: 2, description: 'Something');

      // Assert
      expect(actual.order, equals(2));
      expect(actual.description, equals('Something'));
      expect(actual, isNot(testModel));
    });
  });
}
