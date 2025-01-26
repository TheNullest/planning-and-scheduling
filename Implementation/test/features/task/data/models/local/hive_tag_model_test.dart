import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';
import 'package:zamaan/features/task/data/models/local/tag_local_model.dart';
import 'package:zamaan/features/task/domain/entities/tag_entity.dart';

void main() {
  final entity = TagEntity.empty();
  final testModel = TagLocalModel.fromEntity(entity);
  test('[hiveTagModel] must be a subclass of [TagEntity] ', () {
    // Arrange => testModel

    // Assert
    expect(testModel, isA<TagEntity>());
    expect(testModel, isA<BaseEntityAbstraction>());
  });

  group('hiveTagModel', () {
    test(
        '[hiveTagModel.toEntity] must return a [TagEntity] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = testModel.toEntity();
      // Assert
      expect(actual, equals(entity));
    });

    test(
        '[hiveTagModel.fromEntity] must return a [TagLocalModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = TagLocalModel.fromEntity(entity);
      // Assert
      expect(actual, testModel);
    });

    test(
        '[hiveTagModel.copyWith] must return a customed [RemoteUserModel]with the right data',
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
