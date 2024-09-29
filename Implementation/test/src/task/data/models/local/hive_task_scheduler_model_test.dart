import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/features/task/data/models/local/hive_task_scheduler_model.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';

void main() {
  final TaskSchedulerEntity entity = TaskSchedulerEntity.empty();
  final HiveTaskSchedulerModel testModel =
      HiveTaskSchedulerModel.fromEntity(entity);
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
        '[hiveTaskSchedulerModel.fromEntity] must return a [HiveTaskSchedulerModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = HiveTaskSchedulerModel.fromEntity(entity);
      // Assert
      expect(actual, testModel);
    });

    test(
        '[hiveTaskSchedulerModel.copyWith] must return a customed [RemoteUserModel]with the right data',
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
