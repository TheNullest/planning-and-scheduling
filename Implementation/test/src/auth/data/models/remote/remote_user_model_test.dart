import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:zamaan/features/auth/data/models/remote/remote_user_model.dart';
import 'package:zamaan/features/auth/domain/entities/user_entity.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  // Arrange
  final testModel = RemoteUserModel.empty();
  test('should be a subclass of [User] entity', () {
    // Arrange => testModel

    // Assert
    expect(testModel, isA<UserEntity>());
  });
  final testJson = fixtures('user.json');
  final List<dynamic> testMaps = jsonDecode(testJson);
  group('fromMap', () {
    test('should return a [RemoteUserModel] with the right data', () {
      // Arrange => testModel
      // Act
      final actual = RemoteUserModel.fromMap(testMaps[0]);
      // Assert
      expect(actual, equals(testModel));
    });
  });
  group('fromJson', () {
    test('should return a [RemoteUserModel] with the right data', () {
      // Arrange => testModel
      // Act
      final testJson = jsonEncode(testMaps[0]);
      final actual = RemoteUserModel.fromJSON(testJson);
      expect(actual, equals(testModel));
    });
  });
  group('toMap', () {
    test('should return a [Map] with the right data', () {
      // Arrange => testModel
      // Act
      final actual = testModel.toMap();
      expect(actual, equals(testMaps[0]));
    });
  });
  group('toJson', () {
    test('should return a [Json] with the right data', () {
      // Arrange => testModel
      // Act
      final actual = testModel.toJson();
      final tJson = jsonEncode({
        "id": "1",
        "userName": "_empty.userName",
        "password": "_empty.password",
        "firstName": "_empty.firstName",
        "lastName": "_empty.lastName",
        "emailAddress": "_empty.emailAddress",
        "createdAt": "2004-06-22T08:52:57.685Z",
        "birthDate": "1966-07-06T07:56:35.764Z",
        "description": "_empty.description",
        "avatarPath": "_empty.avatarPath"
      });
      // Assert
      expect(actual, equals(tJson));
    });
  });

  group('copyWith', () {
    test('should return a customed [RemoteUserModel]with the right data', () {
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
