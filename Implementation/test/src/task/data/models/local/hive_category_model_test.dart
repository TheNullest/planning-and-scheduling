import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/features/task/data/models/local/hive_category_model.dart';
import 'package:zamaan/features/task/domain/entities/category_entity.dart';

void main() {
  final CategoryEntity entity = CategoryEntity.empty();
  final HiveCategoryModel testModel = HiveCategoryModel.fromEntity(entity);
  test('[hiveCategoryModel] must be a subclass of [CategoryEntity] ', () {
    // Arrange => testModel

    // Assert
    expect(testModel, isA<CategoryEntity>());
    expect(testModel, isA<BaseEntityAbstraction>());
  });

  group('hiveCategoryModel', () {
    test(
        '[hiveCategoryModel.toEntity] must return a [CategoryEntity] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = testModel.toEntity();
      // Assert
      expect(actual, equals(entity));
    });

    test(
        '[hiveCategoryModel.fromEntity] must return a [HiveCategoryModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = HiveCategoryModel.fromEntity(entity);
      // Assert
      expect(actual, testModel);
    });

    test(
        '[hiveCategoryModel.copyWith] must return a customed [RemoteUserModel]with the right data',
        () {
      // Arrange

      // Act
      final actual = testModel.copyWith(colorCode: 3, description: 'Something');

      // Assert
      expect(actual.colorCode, equals(3));
      expect(actual.description, equals('Something'));
      expect(actual, isNot(testModel));
    });
  });
}
