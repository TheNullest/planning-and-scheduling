import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/features/auth/data/models/local/hive/hive_user_model.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';

void main() {
  final UserEntity entity = UserEntity.empty();
  final HiveUserModel testModel = HiveUserModel.fromEntity(entity);
  test('[hiveUserModel] must be a subclass of [UserEntity] ', () {
    // Arrange => testModel

    // Assert
    expect(testModel, isA<UserEntity>());
    expect(testModel, isA<BaseEntityAbstraction>());
  });

  group('hiveUserModel', () {
    test(
        '[hiveUserModel.toEntity] must return a [UserEntity] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = testModel.toEntity();
      // Assert
      expect(actual, equals(entity));
    });

    test(
        '[hiveUserModel.fromEntity] must return a [HiveUserModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = HiveUserModel.fromEntity(entity);
      // Assert
      expect(actual, testModel);
    });

    test(
        '[hiveUserModel.copyWith] must return a customed [RemoteUserModel]with the right data',
        () {
      // Arrange

      // Act
      final actual = testModel.copyWith(
          userName: 'TheNull', firstName: 'Moien', lastName: 'Janlou');

      // Assert
      expect(actual.userName, equals('TheNull'));
      expect(actual.firstName, equals('Moien'));
      expect(actual.lastName, equals('Janlou'));
      expect(actual, isNot(testModel));
    });
  });
}
