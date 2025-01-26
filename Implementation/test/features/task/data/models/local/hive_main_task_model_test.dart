import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';
import 'package:zamaan/features/task/data/models/local/main_task_local_model.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';

void main() {
  final entity = MainTaskEntity.empty();
  final testModel = MainTaskLocalModel.fromEntity(entity);
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
        '[hiveMainTaskModel.fromEntity] must return a [MainTaskLocalModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = MainTaskLocalModel.fromEntity(entity);
      // Assert
      expect(actual, testModel);
    });

    test(
        '[hiveMainTaskModel.copyWith] must return a customed [RemoteUserModel]with the right data',
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
