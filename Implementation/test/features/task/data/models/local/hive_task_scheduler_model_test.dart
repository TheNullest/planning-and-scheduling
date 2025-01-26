import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';
import 'package:zamaan/features/task/data/models/local/task_scheduler_local_model.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';

void main() {
  final entity = TaskSchedulerEntity.empty();
  final testModel = TaskSchedulerLocalModel.fromEntity(entity);
  test('[hiveTaskSchedulerModel] must be a subclass of [TaskSchedulerEntity] ',
      () {
    // Arrange => testModel

    // Assert
    expect(testModel, isA<TaskSchedulerEntity>());
    expect(testModel, isA<BaseEntityAbstraction>());
  });

  group('hiveTaskSchedulerModel', () {
    test(
        '[hiveTaskSchedulerModel.toEntity] must return a [TaskSchedulerEntity] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = testModel.toEntity();
      // Assert
      expect(actual, equals(entity));
    });

    test(
        '[hiveTaskSchedulerModel.fromEntity] must return a [TaskSchedulerLocalModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = TaskSchedulerLocalModel.fromEntity(entity);
      // Assert
      expect(actual, testModel);
    });

    test(
        '[hiveTaskSchedulerModel.copyWith] must return a customed [RemoteUserModel]with the right data',
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
