import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/core/utils/enums/enums.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_task_scheduler_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_task_scheduler_model.dart';
import 'package:zamaan/features/task/data/repositories/task_scheduler_repository_impl.dart';
import 'package:zamaan/features/task/domain/entities/task_scheduler_entity.dart';
import 'package:zamaan/features/task/domain/params/get_by_task_ids_and_date_range_params.dart';

import '../../../auth/domain/usecases/_authentication_repository.mock.dart';

class MockDataSource extends Mock implements HiveTaskSchedulerDataSourceImpl {}

void main() {
  late HiveTaskSchedulerDataSourceImpl mockDataSource;
  late TaskSchedulerRepositoryImpl taskSchedulerRepo;
  late HiveTaskSchedulerModel model;
  late TaskSchedulerEntity entity;
  late DateTime startAt;
  late DateTime endAt;
  late GetByTaskIdsAndDateRangeParams params;
  setUp(() {
    mockDataSource = MockDataSource();
    taskSchedulerRepo = TaskSchedulerRepositoryImpl(mockDataSource);
    entity = TaskSchedulerEntity.empty();

    model = HiveTaskSchedulerModel.fromEntity(entity);
    startAt = DateTime(2022);
    endAt = DateTime.now();
    params = GetByTaskIdsAndDateRangeParams(
        mainTaskIds: [], startAt: startAt, endAt: endAt);
  });

  group('createEntity', () {
    test(
        '[taskSchedulerRepo.createEntity] must call the [createEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.createEntity(
              newEntity: HiveTaskSchedulerModel.fromEntity(entity)))
          .thenAnswer((_) async => const Right(null));

      final result = await taskSchedulerRepo.createEntity(newEntity: entity);

      expect(result.isRight(), true);
      expect(result, equals(const Right(null)));
      verify(() => mockDataSource.createEntity(
              newEntity: HiveTaskSchedulerModel.fromEntity(entity)))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[taskSchedulerRepo.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.createEntity(
              newEntity: HiveTaskSchedulerModel.fromEntity(entity)))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await taskSchedulerRepo.createEntity(newEntity: entity);

      expect(result.isLeft(), true);
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.createEntity(
              newEntity: HiveTaskSchedulerModel.fromEntity(entity)))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntities', () {
    test(
        '[taskSchedulerRepo.getEntities] must call the [getEntities] of the [dataSource] then returns [Right(List<TaskSchedulerEntity>)] data'
        'which will turn into [Right(List<TaskSchedulerEntity>)] data',
        () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Right([]));

      final result = await taskSchedulerRepo.getEntities();

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<TaskSchedulerEntity>>>());
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[taskSchedulerRepo.getEntities.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await taskSchedulerRepo.getEntities();

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<TaskSchedulerEntity>>>());
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntity', () {
    test(
        '[taskSchedulerRepo.getEntity] must call the [getEntity] of the [dataSource] then returns [Right(TaskSchedulerEntity)] data'
        'which will turn into [Right(List<TaskSchedulerEntity>)] data',
        () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => Right(model));

      final result = await taskSchedulerRepo.getEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, Right<Failure, TaskSchedulerEntity>(entity));
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[taskSchedulerRepo.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await taskSchedulerRepo.getEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(
              const Left<Failure, TaskSchedulerEntity>(HiveFailure("Error"))));
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('updateEntity', () {
    test(
        '[taskSchedulerRepo.updateEntity] must call the [updateEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Right(null));

      final result = await taskSchedulerRepo.updateEntity(entity: entity);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[taskSchedulerRepo.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await taskSchedulerRepo.updateEntity(entity: entity);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure("Error")));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteEntity', () {
    test(
        '[taskSchedulerRepo.deleteEntity] must call the [deleteEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Right(null));

      final result = await taskSchedulerRepo.deleteEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[taskSchedulerRepo.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await taskSchedulerRepo.deleteEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure("Error")));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteAllSelected', () {
    test(
        '[taskSchedulerRepo.deleteAllSelected] must call the [deleteAllSelected] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Right(null));

      final result = await taskSchedulerRepo.deleteAllSelected([model.id]);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[taskSchedulerRepo.deleteAllSelected.failureTest] must return failure when deleteAllSelected fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await taskSchedulerRepo.deleteAllSelected([model.id]);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure("Error")));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getTaskSchedulerByMainTaskIdsAndDateRange', () {
    test(
        '[taskSchedulerRepo.getTaskSchedulerByMainTaskIdsAndDateRange] must call the [getTaskSchedulerByMainTaskIdsAndDateRange] of the [dataSource] then returns [Right(List<TaskSchedulerEntity>)] data'
        'which will turn into [Right(List<TaskSchedulerEntity>)] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersByMainTaskIdsAndDateRange(
          mainTaskIds: [],
          startAt: startAt,
          endAt: endAt)).thenAnswer((_) async => const Right([]));

      final result = await taskSchedulerRepo
          .getTaskSchedulersByMainTaskIdsAndDateRange(params);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<TaskSchedulerEntity>>>());
      verify(() => mockDataSource.getTaskSchedulersByMainTaskIdsAndDateRange(
          mainTaskIds: [],
          startAt: startAt,
          endAt: endAt)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[taskSchedulerRepo.getTaskSchedulersByMainTaskIdsAndDateRange.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersByMainTaskIdsAndDateRange(
              mainTaskIds: [], startAt: startAt, endAt: endAt))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await taskSchedulerRepo
          .getTaskSchedulersByMainTaskIdsAndDateRange(params);

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<TaskSchedulerEntity>>>());
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.getTaskSchedulersByMainTaskIdsAndDateRange(
          mainTaskIds: [],
          startAt: startAt,
          endAt: endAt)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getTaskSchedulersByEndTime', () {
    test(
        '[taskSchedulerRepo.getTaskSchedulersByEndTime] must call the [getTaskSchedulersByEndTime] of the [dataSource] then returns [Right(List<TaskSchedulerEntity>)] data'
        'which will turn into [Right(List<TaskSchedulerEntity>)] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersByEndTime(endAt))
          .thenAnswer((_) async => const Right([]));

      final result = await taskSchedulerRepo.getTaskSchedulersByEndTime(endAt);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<TaskSchedulerEntity>>>());
      verify(() => mockDataSource.getTaskSchedulersByEndTime(endAt))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[taskSchedulerRepo.getTaskSchedulersByMainTaskIdsAndDateRange.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersByEndTime(endAt))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await taskSchedulerRepo.getTaskSchedulersByEndTime(endAt);

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<TaskSchedulerEntity>>>());
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.getTaskSchedulersByEndTime(endAt))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getTaskSchedulersByMainTaskId', () {
    test(
        '[taskSchedulerRepo.getTaskSchedulersByMainTaskId] must call the [getTaskSchedulersByMainTaskId] of the [dataSource] then returns [Right(List<TaskSchedulerEntity>)] data'
        'which will turn into [Right(List<TaskSchedulerEntity>)] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersByMainTaskId('1'))
          .thenAnswer((_) async => const Right([]));

      final result = await taskSchedulerRepo.getTaskSchedulersByMainTaskId('1');

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<TaskSchedulerEntity>>>());
      verify(() => mockDataSource.getTaskSchedulersByMainTaskId('1'))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[taskSchedulerRepo.getTaskSchedulersByMainTaskId.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersByMainTaskId('1'))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await taskSchedulerRepo.getTaskSchedulersByMainTaskId('1');

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<TaskSchedulerEntity>>>());
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.getTaskSchedulersByMainTaskId('1'))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getTaskSchedulersByRepetitionType', () {
    test(
        '[taskSchedulerRepo.getTaskSchedulersByRepetitionType] must call the [getTaskSchedulersByRepetitionType] of the [dataSource] then returns [Right(List<TaskSchedulerEntity>)] data'
        'which will turn into [Right(List<TaskSchedulerEntity>)] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersByRepetitionType(
          RepetitionType.every)).thenAnswer((_) async => const Right([]));

      final result = await taskSchedulerRepo
          .getTaskSchedulersByRepetitionType(RepetitionType.every);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<TaskSchedulerEntity>>>());
      verify(() => mockDataSource
              .getTaskSchedulersByRepetitionType(RepetitionType.every))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[taskSchedulerRepo.getTaskSchedulersByRepetitionType.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource
              .getTaskSchedulersByRepetitionType(RepetitionType.every))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await taskSchedulerRepo
          .getTaskSchedulersByRepetitionType(RepetitionType.every);

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<TaskSchedulerEntity>>>());
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource
              .getTaskSchedulersByRepetitionType(RepetitionType.every))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getTaskSchedulersBySpecificTimes', () {
    test(
        '[taskSchedulerRepo.getTaskSchedulersBySpecificTimes] must call the [getTaskSchedulersBySpecificTimes] of the [dataSource] then returns [Right(List<TaskSchedulerEntity>)] data'
        'which will turn into [Right(List<TaskSchedulerEntity>)] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersBySpecificTimes([]))
          .thenAnswer((_) async => const Right([]));

      final result =
          await taskSchedulerRepo.getTaskSchedulersBySpecificTimes([]);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<TaskSchedulerEntity>>>());
      verify(() => mockDataSource.getTaskSchedulersBySpecificTimes([]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[taskSchedulerRepo.getTaskSchedulersBySpecificTimes.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersBySpecificTimes([]))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result =
          await taskSchedulerRepo.getTaskSchedulersBySpecificTimes([]);

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<TaskSchedulerEntity>>>());
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.getTaskSchedulersBySpecificTimes([]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getTaskSchedulersByStartTime', () {
    test(
        '[taskSchedulerRepo.getTaskSchedulersByStartTime] must call the [getTaskSchedulersByStartTime] of the [dataSource] then returns [Right(List<TaskSchedulerEntity>)] data'
        'which will turn into [Right(List<TaskSchedulerEntity>)] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersByStartTime(startAt))
          .thenAnswer((_) async => const Right([]));

      final result =
          await taskSchedulerRepo.getTaskSchedulersByStartTime(startAt);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<TaskSchedulerEntity>>>());
      verify(() => mockDataSource.getTaskSchedulersByStartTime(startAt))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[taskSchedulerRepo.getTaskSchedulersByStartTime.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersByStartTime(startAt))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result =
          await taskSchedulerRepo.getTaskSchedulersByStartTime(startAt);

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<TaskSchedulerEntity>>>());
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.getTaskSchedulersByStartTime(startAt))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getTaskSchedulersByTimeUnit', () {
    test(
        '[taskSchedulerRepo.getTaskSchedulersByTimeUnit] must call the [getTaskSchedulersByTimeUnit] of the [dataSource] then returns [Right(List<TaskSchedulerEntity>)] data'
        'which will turn into [Right(List<TaskSchedulerEntity>)] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersByTimeUnit(TimeUnit.hour))
          .thenAnswer((_) async => const Right([]));

      final result =
          await taskSchedulerRepo.getTaskSchedulersByTimeUnit(TimeUnit.hour);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<TaskSchedulerEntity>>>());
      verify(() => mockDataSource.getTaskSchedulersByTimeUnit(TimeUnit.hour))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[taskSchedulerRepo.getTaskSchedulersByTimeUnit.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersByTimeUnit(TimeUnit.hour))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result =
          await taskSchedulerRepo.getTaskSchedulersByTimeUnit(TimeUnit.hour);

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<TaskSchedulerEntity>>>());
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.getTaskSchedulersByTimeUnit(TimeUnit.hour))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getTaskSchedulersWithinDateRange', () {
    test(
        '[taskSchedulerRepo.getTaskSchedulersWithinDateRange] must call the [getTaskSchedulersWithinDateRange] of the [dataSource] then returns [Right(List<TaskSchedulerEntity>)] data'
        'which will turn into [Right(List<TaskSchedulerEntity>)] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersWithinDateRange(
          startDate: startAt,
          endDate: endAt)).thenAnswer((_) async => const Right([]));

      final result = await taskSchedulerRepo.getTaskSchedulersWithinDateRange(
          startDate: startAt, endDate: endAt);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<TaskSchedulerEntity>>>());
      verify(() => mockDataSource.getTaskSchedulersWithinDateRange(
          startDate: startAt,
          endDate: endAt)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[taskSchedulerRepo.getTaskSchedulersByTimeUnit.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getTaskSchedulersWithinDateRange(
              startDate: startAt, endDate: endAt))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await taskSchedulerRepo.getTaskSchedulersWithinDateRange(
          startDate: startAt, endDate: endAt);

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<TaskSchedulerEntity>>>());
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.getTaskSchedulersWithinDateRange(
          startDate: startAt,
          endDate: endAt)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
