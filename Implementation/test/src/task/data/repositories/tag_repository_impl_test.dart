import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_tag_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_tag_model.dart';
import 'package:zamaan/features/task/data/repositories/tag_repository_impl.dart';
import 'package:zamaan/features/task/domain/entities/tag_entity.dart';

import '../../../auth/domain/usecases/_authentication_repository.mock.dart';

class MockDataSource extends Mock implements HiveTagDataSourceImpl {}

void main() {
  late HiveTagDataSourceImpl mockDataSource;
  late TagRepositoryImpl tagRepo;
  late HiveTagModel model;
  late TagEntity entity;
  setUp(() {
    mockDataSource = MockDataSource();
    tagRepo = TagRepositoryImpl(mockDataSource);
    entity = TagEntity.empty();
    model = HiveTagModel.fromEntity(entity);
  });

  group('createEntity', () {
    test(
        '[tagRepo.createEntity] must call the [createEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.createEntity(
              newEntity: HiveTagModel.fromEntity(entity)))
          .thenAnswer((_) async => const Right(null));

      final result = await tagRepo.createEntity(newEntity: entity);

      expect(result.isRight(), true);
      expect(result, equals(const Right(null)));
      verify(() => mockDataSource.createEntity(
              newEntity: HiveTagModel.fromEntity(entity)))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[tagRepo.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.createEntity(
              newEntity: HiveTagModel.fromEntity(entity)))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await tagRepo.createEntity(newEntity: entity);

      expect(result.isLeft(), true);
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.createEntity(
              newEntity: HiveTagModel.fromEntity(entity)))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntities', () {
    test(
        '[tagRepo.getEntities] must call the [getEntities] of the [dataSource] then returns [Right(List<TagEntity>)] data'
        'which will turn into [Right(List<TagEntity>)] data', () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Right([]));

      final result = await tagRepo.getEntities();

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<TagEntity>>>());
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[tagRepo.getEntities.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await tagRepo.getEntities();

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<TagEntity>>>());
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntity', () {
    test(
        '[tagRepo.getEntity] must call the [getEntity] of the [dataSource] then returns [Right(TagEntity)] data'
        'which will turn into [Right(List<TagEntity>)] data', () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => Right(model));

      final result = await tagRepo.getEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, Right<Failure, TagEntity>(entity));
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[tagRepo.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await tagRepo.getEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(
          result, equals(const Left<Failure, TagEntity>(HiveFailure("Error"))));
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('updateEntity', () {
    test(
        '[tagRepo.updateEntity] must call the [updateEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Right(null));

      final result = await tagRepo.updateEntity(entity: entity);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[tagRepo.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await tagRepo.updateEntity(entity: entity);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure("Error")));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteEntity', () {
    test(
        '[tagRepo.deleteEntity] must call the [deleteEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Right(null));

      final result = await tagRepo.deleteEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[tagRepo.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await tagRepo.deleteEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure("Error")));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteAllSelected', () {
    test(
        '[tagRepo.deleteAllSelected] must call the [deleteAllSelected] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Right(null));

      final result = await tagRepo.deleteAllSelected([model.id]);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[tagRepo.deleteAllSelected.failureTest] must return failure when deleteAllSelected fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await tagRepo.deleteAllSelected([model.id]);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure("Error")));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
