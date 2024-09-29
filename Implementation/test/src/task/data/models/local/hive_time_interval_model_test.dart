import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/features/task/data/models/local/hive_time_interval_model.dart';
import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';

void main() {
  final TimeIntervalEntity entity = TimeIntervalEntity.empty();
  final HiveTimeIntervalModel testModel =
      HiveTimeIntervalModel.fromEntity(entity);
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
        '[hiveTimeIntervalModel.fromEntity] must return a [HiveTimeIntervalModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = HiveTimeIntervalModel.fromEntity(entity);
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
      expect(actual.order, equals(2));
      expect(actual.description, equals('Something'));
      expect(actual, isNot(testModel));
    });
  });
}
