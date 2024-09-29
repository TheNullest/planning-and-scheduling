import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/features/task/data/models/local/hive_goal_model.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';

void main() {
  final GoalEntity entity = GoalEntity.empty();
  final HiveGoalModel testModel = HiveGoalModel.fromEntity(entity);
  test('[hiveGoalModel] must be a subclass of [GoalEntity] ', () {
    // Arrange => testModel

    // Assert
    expect(testModel, isA<GoalEntity>());
    expect(testModel, isA<BaseEntityAbstraction>());
  });

  group('hiveGoalModel', () {
    test(
        '[hiveGoalModel.toEntity] must return a [GoalEntity] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = testModel.toEntity();
      // Assert
      expect(actual, equals(entity));
    });

    test(
        '[hiveGoalModel.fromEntity] must return a [HiveGoalModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = HiveGoalModel.fromEntity(entity);
      // Assert
      expect(actual, testModel);
    });

    test(
        '[hiveGoalModel.copyWith] must return a customed [RemoteUserModel]with the right data',
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
