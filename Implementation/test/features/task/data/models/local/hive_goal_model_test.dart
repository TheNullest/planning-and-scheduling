import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';
import 'package:zamaan/features/task/data/models/local/goal_local_model.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';

void main() {
  final entity = GoalEntity.empty();
  final testModel = GoalLocalModel.fromEntity(entity);
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
        '[hiveGoalModel.fromEntity] must return a [GoalLocalModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = GoalLocalModel.fromEntity(entity);
      // Assert
      expect(actual, testModel);
    });

    test(
        '[hiveGoalModel.copyWith] must return a customed [RemoteUserModel]with the right data',
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
