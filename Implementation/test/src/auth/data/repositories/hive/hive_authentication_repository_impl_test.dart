import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/utils/uuid.dart';
import 'package:zamaan/features/auth/data/data_sources/hive_authentication_data_source_impl.dart';
import 'package:zamaan/features/auth/data/models/hive/hive_user_model.dart';
import 'package:zamaan/features/auth/data/repositories/hive/hive_authentication_repository_impl.dart';

import '../../../domain/usecases/_authentication_repository.mock.dart';

class MockAuthDataSource extends Mock
    implements HiveAuthenticationDataSourceImpl {}

void main() {
  late HiveAuthenticationDataSourceImpl mockDataSource;
  late HiveAuthenticationRepositoryImpl authRepo;
  late HiveUserModel model;
  late UserEntity entity;
  late List<String> keys;
  setUp(() {
    mockDataSource = MockAuthDataSource();
    authRepo = HiveAuthenticationRepositoryImpl(mockDataSource);
    entity = UserEntity.empty();
    model = HiveUserModel.fromEntity(entity);
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
    test(
        '[authRepo.createEntity] must call the [createEntity] of the [dataStore] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.createEntity(
              newEntity: HiveUserModel.fromEntity(entity)))
          .thenAnswer((_) async => const Right(null));

      final result = await authRepo.createEntity(newEntity: entity);

      expect(result.isRight(), true);
      expect(result, equals(const Right(null)));
      verify(() => mockDataSource.createEntity(
              newEntity: HiveUserModel.fromEntity(entity)))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntities', () {
    test(
        '[authRepo.getEntities] must call the [getEntities] of the [dataStore] then returns [Right(List<UserEntity>)] data'
        'wich should be converted into a [Right(List<UserEntity>)] data',
        () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Right([]));

      final result = await authRepo.getEntities();

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<UserEntity>>>());
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });
  group('getEntity', () {
    test(
        '[authRepo.getEntity] must call the [getEntity] of the [dataStore] then returns [Right(UserEntity)] data'
        'wich should be converted into a [Right(List<UserEntity>)] data',
        () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => Right(model));

      final result = await authRepo.getEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, Right<Failure, UserEntity>(entity));
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });
  group('updateEntity', () {
    test(
        '[authRepo.updateEntity] must call the [updateEntity] of the [dataStore] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Right(null));

      final result = await authRepo.updateEntity(entity: entity);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });
  group('deleteEntity', () {
    test(
        '[authRepo.deleteEntity] must call the [deleteEntity] of the [dataStore] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Right(null));

      final result = await authRepo.deleteEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });
  group('deleteAllSelected', () {
    test(
        '[authRepo.deleteAllSelected] must call the [deleteAllSelected] of the [dataStore] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Right(null));

      final result = await authRepo.deleteAllSelected([model.id]);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
