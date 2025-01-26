import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_category_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/category_local_model.dart';
import 'package:zamaan/features/task/domain/entities/category_entity.dart';


class MockDataSource extends Mock implements HiveCategoryDataSourceImpl {}

void main() {
  late HiveCategoryDataSourceImpl mockDataSource;
  late CategoryRepositoryImpl categoryRepo;
  late CategoryLocalModel model;
  late CategoryEntity entity;
  setUp(() {
    mockDataSource = MockDataSource();
    categoryRepo = CategoryRepositoryImpl(mockDataSource);
    entity = CategoryEntity.empty();
    model = CategoryLocalModel.fromEntity(entity);
  });

  group('createEntity', () {
    test(
        '[categoryRepo.createEntity] must call the [createEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(
        () => mockDataSource.createEntity(
          newEntity: CategoryLocalModel.fromEntity(entity),
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await categoryRepo.createEntity(newEntity: entity);

      expect(result.isRight(), true);
      expect(result, equals(const Right(null)));
      verify(
        () => mockDataSource.createEntity(
          newEntity: CategoryLocalModel.fromEntity(entity),
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[categoryRepo.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockDataSource.createEntity(
          newEntity: CategoryLocalModel.fromEntity(entity),
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await categoryRepo.createEntity(newEntity: entity);

      expect(result.isLeft(), true);
      expect(result, equals(const Left(HiveFailure('Error'))));
      verify(
        () => mockDataSource.createEntity(
          newEntity: CategoryLocalModel.fromEntity(entity),
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntities', () {
    test(
        '[categoryRepo.getEntities] must call the [getEntities] of the [dataSource] then returns [Right(List<CategoryEntity>)] data'
        'which will turn into [Right(List<CategoryEntity>)] data', () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Right([]));

      final result = await categoryRepo.getEntities();

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<CategoryEntity>>>());
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[categoryRepo.getEntities.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await categoryRepo.getEntities();

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<CategoryEntity>>>());
      expect(result, equals(const Left(HiveFailure('Error'))));
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntity', () {
    test(
        '[categoryRepo.getEntity] must call the [getEntity] of the [dataSource] then returns [Right(CategoryEntity)] data'
        'which will turn into [Right(List<CategoryEntity>)] data', () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => Right(model));

      final result = await categoryRepo.getEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, Right<Failure, CategoryEntity>(entity));
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[categoryRepo.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await categoryRepo.getEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(
        result,
        equals(const Left<Failure, CategoryEntity>(HiveFailure('Error'))),
      );
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('updateEntity', () {
    test(
        '[categoryRepo.updateEntity] must call the [updateEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Right(null));

      final result = await categoryRepo.updateEntity(entity: entity);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[categoryRepo.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await categoryRepo.updateEntity(entity: entity);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure('Error')));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteEntity', () {
    test(
        '[categoryRepo.deleteEntity] must call the [deleteEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Right(null));

      final result = await categoryRepo.deleteEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[categoryRepo.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await categoryRepo.deleteEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure('Error')));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteAllSelected', () {
    test(
        '[categoryRepo.deleteAllSelected] must call the [deleteAllSelected] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Right(null));

      final result = await categoryRepo.deleteAllSelected([model.id]);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[categoryRepo.deleteAllSelected.failureTest] must return failure when deleteAllSelected fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await categoryRepo.deleteAllSelected([model.id]);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure('Error')));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
