import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/core/utils/uuid.dart';
import 'package:zamaan/features/auth/data/data_sources/local/hive_authentication_data_source_impl.dart';
import 'package:zamaan/features/auth/data/models/local/hive/hive_user_model.dart';

class MockHiveInit extends Mock implements HiveInitializer<HiveUserModel> {}

void main() {
  late AuthenticationDataSourceImpl dataSource;
  late HiveInitializer<HiveUserModel> mockHiveInit;
  late HiveUserModel model;
  late List<String> keys;
  setUp(() {
    mockHiveInit = MockHiveInit();
    dataSource = AuthenticationDataSourceImpl(hiveBox: mockHiveInit);
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

  group('authDataStore', () {
    test(
        '[authDataStore.createEntity] must save entity to the box and returns [Right(null)] data',
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

    test(
        '[authDataStore.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<void>(
              job: any(named: 'job'), boxName: 'usersBox'))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.createEntity(newEntity: model);

      expect(result.isLeft(), true);
      expect(result, equals(const Left(HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<void>(
              job: any(named: 'job'), boxName: 'usersBox'))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataStore.getEntities] should retrieve all entities from the box [Right([])] data ',
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

    test(
        '[authDataStore.getEntities.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveUserModel>>(
              job: any(named: 'job'), boxName: 'usersBox'))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getEntities();

      expect(result.isLeft(), true);
      expect(
          result,
          equals(
              const Left<Failure, List<HiveUserModel>>(HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveUserModel>>(
              job: any(named: 'job'), boxName: 'usersBox'))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataStore.getEntity] should retrieve entity by id from the box and returns [Right(HiveUserModel)] data',
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

    test(
        '[authDataStore.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<HiveUserModel>(
              job: any(named: 'job'), boxName: 'usersBox'))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isLeft(), true);
      expect(result,
          equals(const Left<Failure, HiveUserModel>(HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<HiveUserModel>(
            job: any(named: 'job'), boxName: 'usersBox'),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataStore.updateEntity] must update entity in the box and returns [Right(null)] data',
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

    test(
        '[authDataStore.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<void>(
              job: any(named: 'job'), boxName: 'usersBox'))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.updateEntity(entity: model);

      expect(result.isLeft(), true);
      expect(result, equals(const Left<Failure, void>(HiveFailure("Error"))));
      verify(() => mockHiveInit.operator<void>(
              job: any(named: 'job'), boxName: 'usersBox'))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataStore.deleteEntity] must delete entity by id from the box and returns [Right(null)] data',
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

    test(
        '[authDataStore.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<void>(
              job: any(named: 'job'), boxName: 'usersBox'))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.deleteEntity(id: model.id);

      expect(result.isLeft(), true);
      expect(result, equals(const Left<Failure, void>(HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<void>(
            job: any(named: 'job'), boxName: 'usersBox'),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataStore.deleteAllSelected] should delete from the box all the entities whose [ID] it has received and returns [Right(null)] data',
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

    test(
        '[authDataStore.deleteAllSelected.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<void>(
              job: any(named: 'job'), boxName: 'usersBox'))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.deleteAllSelected(keys);

      expect(result.isLeft(), true);
      expect(result, equals(const Left<Failure, void>(HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<void>(
            job: any(named: 'job'), boxName: 'usersBox'),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });
  });
}
