import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';
import 'package:zamaan/features/task/data/models/local/time_interval_local_model.dart';
import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';

void main() {
  final entity = TimeIntervalEntity.empty();
  final testModel = TimeIntervalLocalModel.fromEntity(entity);
  test('[hiveTimeIntervalModel] must be a subclass of [TimeIntervalEntity] ',
      () {
    // Arrange => testModel

    // Assert
    expect(testModel, isA<TimeIntervalEntity>());
    expect(testModel, isA<BaseEntityAbstraction>());
  });

  group('hiveTimeIntervalModel', () {
    test(
        '[hiveTimeIntervalModel.toEntity] must return a [TimeIntervalEntity] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = testModel.toEntity();
      // Assert
      expect(actual, equals(entity));
    });

    test(
        '[hiveTimeIntervalModel.fromEntity] must return a [TimeIntervalLocalModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = TimeIntervalLocalModel.fromEntity(entity);
      // Assert
      expect(actual, testModel);
    });

    test(
        '[hiveTimeIntervalModel.copyWith] must return a customed [RemoteUserModel]with the right data',
        () {
      // Arrange

      // Act
      final actual = testModel.copyWith(order: 2, description: 'Something');

      // Assert
      expect(actual.description, equals('Something'));
      expect(actual, isNot(testModel));
    });
  });
}
