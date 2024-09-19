import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/core/utils/uuid.dart';
import 'package:zamaan/features/auth/data/data_sources/hive_authentication_data_source_impl.dart';
import 'package:zamaan/features/auth/data/models/hive/hive_user_model.dart';

class MockHiveInit extends Mock implements HiveInitializer<HiveUserModel> {}

void main() {
  late HiveAuthenticationDataSourceImpl dataSource;
  late HiveInitializer<HiveUserModel> mockHiveInit;
  late HiveUserModel model;
  late List<String> keys;
  setUp(() {
    mockHiveInit = MockHiveInit();
    dataSource = HiveAuthenticationDataSourceImpl(hiveBox: mockHiveInit);
    model = HiveUserModel.empty();
    keys = [
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
    ];
  });

  group('createEntity', () {
    test('should save entity to the box and returns [Right(null)] data',
        () async {
      when(() => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox')).thenAnswer((_) async => const Right(null));

      final result = await dataSource.createEntity(newEntity: model);

      expect(result.isRight(), true);
      expect(result, equals(const Right(null)));
      verify(() => mockHiveInit.operator<void>(
              job: any(named: 'job'), boxName: 'usersBox'))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });
  });

  group('getEntities', () {
    test(
        'getEntities should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveUserModel>>(
          job: any(named: 'job'),
          boxName: 'usersBox')).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getEntities();

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, List<HiveUserModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveUserModel>>(
              job: any(named: 'job'), boxName: 'usersBox'))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });
  });

  group('getEntity', () {
    test(
        'getEntity should retrieve entity by id from the box and returns [Right(HiveUserModel)] data',
        () async {
      when(() => mockHiveInit.operator<HiveUserModel>(
          job: any(named: 'job'),
          boxName: 'usersBox')).thenAnswer((_) async => Right(model));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isRight(), true);
      expect(result, equals(Right<Failure, HiveUserModel>(model)));
      verify(
        () => mockHiveInit.operator<HiveUserModel>(
            job: any(named: 'job'), boxName: 'usersBox'),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });
  });

  group('updateEntity', () {
    test(
        'updateEntity should update entity in the box and returns [Right(null)] data',
        () async {
      when(() => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox')).thenAnswer((_) async => const Right(null));

      final result = await dataSource.updateEntity(entity: model);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, void>(null)));
      verify(() => mockHiveInit.operator<void>(
              job: any(named: 'job'), boxName: 'usersBox'))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });
  });

  group('deleteEntity', () {
    test(
        'deleteEntity should delete entity by id from the box and returns [Right(null)] data',
        () async {
      when(() => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox')).thenAnswer((_) async => const Right(null));

      final result = await dataSource.deleteEntity(id: model.id);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, void>(null)));
      verify(
        () => mockHiveInit.operator<void>(
            job: any(named: 'job'), boxName: 'usersBox'),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });
  });
  group('deleteAllSelected', () {
    test(
        'deleteAllSelected should delete from the box all the entities whose [ID] it has received and returns [Right(null)] data',
        () async {
      when(() => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox')).thenAnswer((_) async => const Right(null));

      final result = await dataSource.deleteAllSelected(keys);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, void>(null)));
      verify(
        () => mockHiveInit.operator<void>(
            job: any(named: 'job'), boxName: 'usersBox'),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });
  });
}
