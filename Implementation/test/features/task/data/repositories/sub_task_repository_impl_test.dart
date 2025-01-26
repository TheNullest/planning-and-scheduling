import 'package:zamaan/core/enums/enums.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_sub_task_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/sub_task_local_model.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';


class MockDataSource extends Mock implements HiveSubTaskDataSourceImpl {}

void main() {
  late HiveSubTaskDataSourceImpl mockDataSource;
  late SubTaskRepositoryImpl subTaskRepo;
  late SubTaskLocalModel model;
  late SubTaskEntity entity;
  setUp(() {
    mockDataSource = MockDataSource();
    subTaskRepo = SubTaskRepositoryImpl(mockDataSource);
    entity = SubTaskEntity.empty();
    model = SubTaskLocalModel.fromEntity(entity);
  });

  group('createEntity', () {
    test(
        '[subTaskRepo.createEntity] must call the [createEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(
        () => mockDataSource.createEntity(
          newEntity: SubTaskLocalModel.fromEntity(entity),
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await subTaskRepo.createEntity(newEntity: entity);

      expect(result.isRight(), true);
      expect(result, equals(const Right(null)));
      verify(
        () => mockDataSource.createEntity(
          newEntity: SubTaskLocalModel.fromEntity(entity),
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[subTaskRepo.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockDataSource.createEntity(
          newEntity: SubTaskLocalModel.fromEntity(entity),
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await subTaskRepo.createEntity(newEntity: entity);

      expect(result.isLeft(), true);
      expect(result, equals(const Left(HiveFailure('Error'))));
      verify(
        () => mockDataSource.createEntity(
          newEntity: SubTaskLocalModel.fromEntity(entity),
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntities', () {
    test(
        '[subTaskRepo.getEntities] must call the [getEntities] of the [dataSource] then returns [Right(List<SubTaskEntity>)] data'
        'which will turn into [Right(List<SubTaskEntity>)] data', () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Right([]));

      final result = await subTaskRepo.getEntities();

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<SubTaskEntity>>>());
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[subTaskRepo.getEntities.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await subTaskRepo.getEntities();

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<SubTaskEntity>>>());
      expect(result, equals(const Left(HiveFailure('Error'))));
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntity', () {
    test(
        '[subTaskRepo.getEntity] must call the [getEntity] of the [dataSource] then returns [Right(SubTaskEntity)] data'
        'which will turn into [Right(List<SubTaskEntity>)] data', () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => Right(model));

      final result = await subTaskRepo.getEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, Right<Failure, SubTaskEntity>(entity));
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[subTaskRepo.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await subTaskRepo.getEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(
        result,
        equals(const Left<Failure, SubTaskEntity>(HiveFailure('Error'))),
      );
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('updateEntity', () {
    test(
        '[subTaskRepo.updateEntity] must call the [updateEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Right(null));

      final result = await subTaskRepo.updateEntity(entity: entity);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[subTaskRepo.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await subTaskRepo.updateEntity(entity: entity);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure('Error')));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteEntity', () {
    test(
        '[subTaskRepo.deleteEntity] must call the [deleteEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Right(null));

      final result = await subTaskRepo.deleteEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[subTaskRepo.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await subTaskRepo.deleteEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure('Error')));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteAllSelected', () {
    test(
        '[subTaskRepo.deleteAllSelected] must call the [deleteAllSelected] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Right(null));

      final result = await subTaskRepo.deleteAllSelected([model.id]);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[subTaskRepo.deleteAllSelected.failureTest] must return failure when deleteAllSelected fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await subTaskRepo.deleteAllSelected([model.id]);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure('Error')));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getSubTasksByMainTaskId', () {
    test(
        '[subTaskRepo.getSubTasksByMainTaskId] must call the [getSubTasksByMainTaskId] of the [dataSource] then returns [Right(List<SubTaskEntity>)] data'
        'which will turn into [Right(List<SubTaskEntity>)] data', () async {
      when(() => mockDataSource.getSubTasksByMainTaskId('1'))
          .thenAnswer((_) async => const Right([]));

      final result = await subTaskRepo.getSubTasksByMainTaskId('1');

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<SubTaskEntity>>>());
      verify(() => mockDataSource.getSubTasksByMainTaskId('1'))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[subTaskRepo.getSubTasksByMainTaskId.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getSubTasksByMainTaskId('1'))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await subTaskRepo.getSubTasksByMainTaskId('1');

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<SubTaskEntity>>>());
      expect(result, equals(const Left(HiveFailure('Error'))));
      verify(() => mockDataSource.getSubTasksByMainTaskId('1'))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getSubTasksByPriority', () {
    test(
        '[subTaskRepo.getSubTasksByPriority] must call the [getSubTasksByPriority] of the [dataSource] then returns [Right(List<SubTaskEntity>)] data'
        'which will turn into [Right(List<SubTaskEntity>)] data', () async {
      when(() => mockDataSource.getSubTasksByPriority(Priority.critical))
          .thenAnswer((_) async => const Right([]));

      final result = await subTaskRepo.getSubTasksByPriority(Priority.critical);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<SubTaskEntity>>>());
      verify(() => mockDataSource.getSubTasksByPriority(Priority.critical))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[subTaskRepo.getSubTasksByPriority.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getSubTasksByPriority(Priority.critical))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await subTaskRepo.getSubTasksByPriority(Priority.critical);

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<SubTaskEntity>>>());
      expect(result, equals(const Left(HiveFailure('Error'))));
      verify(() => mockDataSource.getSubTasksByPriority(Priority.critical))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getSubTasksByStatus', () {
    test(
        '[subTaskRepo.getSubTasksByStatus] must call the [getSubTasksByStatus] of the [dataSource] then returns [Right(List<SubTaskEntity>)] data'
        'which will turn into [Right(List<SubTaskEntity>)] data', () async {
      when(() => mockDataSource.getSubTasksByStatus(Status.inProgress))
          .thenAnswer((_) async => const Right([]));

      final result = await subTaskRepo.getSubTasksByStatus(Status.inProgress);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<SubTaskEntity>>>());
      verify(() => mockDataSource.getSubTasksByStatus(Status.inProgress))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[subTaskRepo.getSubTasksByStatus.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getSubTasksByStatus(Status.inProgress))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await subTaskRepo.getSubTasksByStatus(Status.inProgress);

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<SubTaskEntity>>>());
      expect(result, equals(const Left(HiveFailure('Error'))));
      verify(() => mockDataSource.getSubTasksByStatus(Status.inProgress))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
