import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_goal_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/goal_local_model.dart';
import 'package:zamaan/features/task/domain/entities/goal_entity.dart';


class MockDataSource extends Mock implements HiveGoalDataSourceImpl {}

void main() {
  late HiveGoalDataSourceImpl mockDataSource;
  late GoalRepositoryImpl goalRepo;
  late GoalLocalModel model;
  late GoalEntity entity;
  setUp(() {
    mockDataSource = MockDataSource();
    goalRepo = GoalRepositoryImpl(mockDataSource);
    entity = GoalEntity.empty();
    model = GoalLocalModel.fromEntity(entity);
  });

  group('createEntity', () {
    test(
        '[goalRepo.createEntity] must call the [createEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(
        () => mockDataSource.createEntity(
          newEntity: GoalLocalModel.fromEntity(entity),
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await goalRepo.createEntity(newEntity: entity);

      expect(result.isRight(), true);
      expect(result, equals(const Right(null)));
      verify(
        () => mockDataSource.createEntity(
          newEntity: GoalLocalModel.fromEntity(entity),
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[goalRepo.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockDataSource.createEntity(
          newEntity: GoalLocalModel.fromEntity(entity),
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await goalRepo.createEntity(newEntity: entity);

      expect(result.isLeft(), true);
      expect(result, equals(const Left(HiveFailure('Error'))));
      verify(
        () => mockDataSource.createEntity(
          newEntity: GoalLocalModel.fromEntity(entity),
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntities', () {
    test(
        '[goalRepo.getEntities] must call the [getEntities] of the [dataSource] then returns [Right(List<GoalEntity>)] data'
        'which will turn into [Right(List<GoalEntity>)] data', () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Right([]));

      final result = await goalRepo.getEntities();

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<GoalEntity>>>());
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[goalRepo.getEntities.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await goalRepo.getEntities();

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<GoalEntity>>>());
      expect(result, equals(const Left(HiveFailure('Error'))));
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntity', () {
    test(
        '[goalRepo.getEntity] must call the [getEntity] of the [dataSource] then returns [Right(GoalEntity)] data'
        'which will turn into [Right(List<GoalEntity>)] data', () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => Right(model));

      final result = await goalRepo.getEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, Right<Failure, GoalEntity>(entity));
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[goalRepo.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await goalRepo.getEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(
        result,
        equals(const Left<Failure, GoalEntity>(HiveFailure('Error'))),
      );
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('updateEntity', () {
    test(
        '[goalRepo.updateEntity] must call the [updateEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Right(null));

      final result = await goalRepo.updateEntity(entity: entity);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[goalRepo.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await goalRepo.updateEntity(entity: entity);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure('Error')));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteEntity', () {
    test(
        '[goalRepo.deleteEntity] must call the [deleteEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Right(null));

      final result = await goalRepo.deleteEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[goalRepo.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await goalRepo.deleteEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure('Error')));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteAllSelected', () {
    test(
        '[goalRepo.deleteAllSelected] must call the [deleteAllSelected] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Right(null));

      final result = await goalRepo.deleteAllSelected([model.id]);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[goalRepo.deleteAllSelected.failureTest] must return failure when deleteAllSelected fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await goalRepo.deleteAllSelected([model.id]);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure('Error')));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
