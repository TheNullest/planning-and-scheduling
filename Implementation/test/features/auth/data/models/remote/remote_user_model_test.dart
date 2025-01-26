import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/common/entities/user_entity.dart';
import 'package:zamaan/features/auth/data/models/local/local_user_model.dart';
import 'package:zamaan/features/auth/data/models/remote/remote_user_model.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  // Arrange
  final testModel = RemoteUserModel.empty();
  test(
      '[remoteUserModel] must be a subclass of [UserEntity] and [HiveUserModel]',
      () {
    // Arrange => testModel

    // Assert
    expect(testModel, isA<LocalUserModel>());
    expect(testModel, isA<UserEntity>());
    expect(testModel, isA<BaseEntityAbstraction>());
  });

  group('remoteUserModel', () {
    test(
        '[remoteUserModel.fromMap] must return a [RemoteUserModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = RemoteUserModel.fromSupabaseUserJson(
        getRemoteUserModels()[0].toMap(),
      );
      // Assert
      expect(actual, equals(getRemoteUserModels()[0]));
    });
    test(
        '[remoteUserModel.fromJson] must return a [RemoteUserModel] with the right data',
        () {
      // Arrange => testModel
      // Act
      final testJson = testModel.toMap();
      final actual = RemoteUserModel.fromSupabaseUserJson(testJson);
      expect(actual, equals(testModel));
    });
    test('[remoteUserModel.toMap] must return a [Map] with the right data', () {
      // Arrange => testModel
      // Act
      final actual = getRemoteUserModels()[2].toMap();
      expect(actual, equals(testMaps[2]));
    });
    test('[remoteUserModel.toJson] must return a [Json] with the right data',
        () {
      // Arrange => testModel
      // Act
      final actual = testModel.toJson();
      final tJson = jsonEncode(testModel.toMap());
      // Assert
      expect(actual, equals(tJson));
    });
    test(
        '[remoteUserModel.copyWith] must return a customed [RemoteUserModel]with the right data',
        () {
      // Arrange

      // Act
      final actual = testModel.copyWith(
        userName: 'TheNull',
        firstName: 'Moien',
        lastName: 'Janlou',
      );

      // Assert
      expect(actual.userName, equals('TheNull'));
      expect(actual.firstName, equals('Moien'));
      expect(actual.lastName, equals('Janlou'));
      expect(actual, isNot(testModel));
    });
  });
}
