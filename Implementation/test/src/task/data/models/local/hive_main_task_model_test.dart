import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/features/task/data/models/local/hive_main_task_model.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';

void main() {
  final MainTaskEntity entity = MainTaskEntity.empty();
  final HiveMainTaskModel testModel = HiveMainTaskModel.fromEntity(entity);
  test('[hiveMainTaskModel] must be a subclass of [MainTaskEntity] ', () {
    // Arrange => testModel

    // Assert
    expect(testModel, isA<MainTaskEntity>());
    expect(testModel, isA<BaseEntityAbstraction>());
  });

  group('hiveMainTaskModel', () {
    test(
        '[hiveMainTaskModel.toEntity] must return a [MainTaskEntity] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = testModel.toEntity();
      // Assert
      expect(actual, equals(entity));
    });

    test(
        '[hiveMainTaskModel.fromEntity] must return a [HiveMainTaskModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = HiveMainTaskModel.fromEntity(entity);
      // Assert
      expect(actual, testModel);
    });

    test(
        '[hiveMainTaskModel.copyWith] must return a customed [RemoteUserModel]with the right data',
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
