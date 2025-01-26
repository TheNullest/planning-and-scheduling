import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/errors/exceptions/failure.dart';
import 'package:zamaan/core/errors/exceptions/local_exception.dart';
import 'package:zamaan/core/services/hive_services.dart';
import 'package:zamaan/core/utils/uuid.dart';
import 'package:zamaan/features/auth/data/data_sources/local/local_auth_data_source_impl.dart';
import 'package:zamaan/features/auth/data/models/local/local_user_model.dart';

class MockHiveInit extends Mock implements HiveServices<LocalUserModel> {}

void main() {
  late LocalAuthDataSourceImpl dataSource;
  late HiveServices<LocalUserModel> mockHiveInit;
  late LocalUserModel model;
  late List<String> keys;
  setUp(() {
    mockHiveInit = MockHiveInit();
    dataSource = LocalAuthDataSourceImpl();
    model = LocalUserModel.empty();
    keys = [
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
    ];
  });

  group('authDataSource', () {
    test(
        '[authDataSource.createEntity] must save entity to the box and returns [Right(null)] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await dataSource.createEntity(newEntity: model);

      expect(result.isRight(), true);
      expect(result, equals(const Right(null)));
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataSource.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).thenAnswer((_) async => Left(LocalException(message: 'Error')));

      final result = await dataSource.createEntity(newEntity: model);

      expect(result.isLeft(), true);
      expect(result, equals(Left(LocalException(message: 'Error'))));
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataSource.getEntities] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(
        () => mockHiveInit.operator<List<LocalUserModel>>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getEntities();

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, List<LocalUserModel>>([])));
      verify(
        () => mockHiveInit.operator<List<LocalUserModel>>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataSource.getEntities.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(
        () => mockHiveInit.operator<List<LocalUserModel>>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).thenAnswer((_) async => Left(LocalException(message: 'Error')));

      final result = await dataSource.getEntities();

      expect(result.isLeft(), true);
      expect(
        result,
        equals(
          Left(LocalException(message: 'Error')),
        ),
      );
      verify(
        () => mockHiveInit.operator<List<LocalUserModel>>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataSource.getEntity] should retrieve entity by id from the box and returns [Right(HiveUserModel)] data',
        () async {
      when(
        () => mockHiveInit.operator<LocalUserModel>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).thenAnswer((_) async => Right(model));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isRight(), true);
      expect(result, equals(Right<Failure, LocalUserModel>(model)));
      verify(
        () => mockHiveInit.operator<LocalUserModel>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataSource.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockHiveInit.operator<LocalUserModel>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).thenAnswer((_) async => const Left(LocalException(message: 'Error')));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isLeft(), true);
      expect(
        result,
        equals(
          const Left<Failure, LocalUserModel>(
            LocalException(message: 'Error'),
          ),
        ),
      );
      verify(
        () => mockHiveInit.operator<LocalUserModel>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataSource.updateEntity] must update entity in the box and returns [Right(null)] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await dataSource.updateEntity(entity: model);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, void>(null)));
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataSource.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).thenAnswer((_) async => const Left(LocalException(message: 'Error')));

      final result = await dataSource.updateEntity(entity: model);

      expect(result.isLeft(), true);
      expect(
        result,
        equals(const Left<Failure, void>(LocalException(message: 'Error'))),
      );
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataSource.deleteEntity] must delete entity by id from the box and returns [Right(null)] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await dataSource.deleteEntity(id: model.id);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, void>(null)));
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataSource.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).thenAnswer((_) async => const Left(LocalException(message: 'Error')));

      final result = await dataSource.deleteEntity(id: model.id);

      expect(result.isLeft(), true);
      expect(
        result,
        equals(const Left<Failure, void>(LocalException(message: 'Error'))),
      );
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataSource.deleteAllSelected] should delete from the box all the entities whose [ID] it has received and returns [Right(null)] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await dataSource.deleteAllSelected(keys);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, void>(null)));
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[authDataSource.deleteAllSelected.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).thenAnswer((_) async => const Left(LocalException(message: 'Error')));

      final result = await dataSource.deleteAllSelected(keys);

      expect(result.isLeft(), true);
      expect(
        result,
        equals(const Left<Failure, void>(LocalException(message: 'Error'))),
      );
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: 'usersBox',
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });
  });
}
