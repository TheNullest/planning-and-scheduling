import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_time_interval_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_time_interval_model.dart';
import 'package:zamaan/features/task/data/repositories/time_interval_repository_impl.dart';
import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';
import 'package:zamaan/features/task/domain/params/get_by_task_ids_and_date_range_params.dart';

import '../../../auth/domain/usecases/_authentication_repository.mock.dart';

class MockDataSource extends Mock implements HiveTimeIntervalDataSourceImpl {}

void main() {
  late HiveTimeIntervalDataSourceImpl mockDataSource;
  late TimeIntervalRepositoryImpl timeIntervalRepo;
  late HiveTimeIntervalModel model;
  late TimeIntervalEntity entity;
  late DateTime startAt;
  late DateTime endAt;
  late GetByTaskIdsAndDateRangeParams params;
  setUp(() {
    mockDataSource = MockDataSource();
    timeIntervalRepo = TimeIntervalRepositoryImpl(mockDataSource);
    entity = TimeIntervalEntity.empty();
    model = HiveTimeIntervalModel.fromEntity(entity);
    startAt = DateTime(2022);
    endAt = DateTime.now();
    params = GetByTaskIdsAndDateRangeParams(
        mainTaskIds: [], startAt: startAt, endAt: endAt);
  });

  group('createEntity', () {
    test(
        '[timeIntervalRepo.createEntity] must call the [createEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.createEntity(
              newEntity: HiveTimeIntervalModel.fromEntity(entity)))
          .thenAnswer((_) async => const Right(null));

      final result = await timeIntervalRepo.createEntity(newEntity: entity);

      expect(result.isRight(), true);
      expect(result, equals(const Right(null)));
      verify(() => mockDataSource.createEntity(
              newEntity: HiveTimeIntervalModel.fromEntity(entity)))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[timeIntervalRepo.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.createEntity(
              newEntity: HiveTimeIntervalModel.fromEntity(entity)))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await timeIntervalRepo.createEntity(newEntity: entity);

      expect(result.isLeft(), true);
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.createEntity(
              newEntity: HiveTimeIntervalModel.fromEntity(entity)))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntities', () {
    test(
        '[timeIntervalRepo.getEntities] must call the [getEntities] of the [dataSource] then returns [Right(List<TimeIntervalEntity>)] data'
        'which will turn into [Right(List<TimeIntervalEntity>)] data',
        () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Right([]));

      final result = await timeIntervalRepo.getEntities();

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<TimeIntervalEntity>>>());
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[timeIntervalRepo.getEntities.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await timeIntervalRepo.getEntities();

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<TimeIntervalEntity>>>());
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntity', () {
    test(
        '[timeIntervalRepo.getEntity] must call the [getEntity] of the [dataSource] then returns [Right(TimeIntervalEntity)] data'
        'which will turn into [Right(List<TimeIntervalEntity>)] data',
        () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => Right(model));

      final result = await timeIntervalRepo.getEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, Right<Failure, TimeIntervalEntity>(entity));
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[timeIntervalRepo.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await timeIntervalRepo.getEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(
              const Left<Failure, TimeIntervalEntity>(HiveFailure("Error"))));
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('updateEntity', () {
    test(
        '[timeIntervalRepo.updateEntity] must call the [updateEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Right(null));

      final result = await timeIntervalRepo.updateEntity(entity: entity);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[timeIntervalRepo.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await timeIntervalRepo.updateEntity(entity: entity);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure("Error")));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteEntity', () {
    test(
        '[timeIntervalRepo.deleteEntity] must call the [deleteEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Right(null));

      final result = await timeIntervalRepo.deleteEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[timeIntervalRepo.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await timeIntervalRepo.deleteEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure("Error")));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteAllSelected', () {
    test(
        '[timeIntervalRepo.deleteAllSelected] must call the [deleteAllSelected] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Right(null));

      final result = await timeIntervalRepo.deleteAllSelected([model.id]);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[timeIntervalRepo.deleteAllSelected.failureTest] must return failure when deleteAllSelected fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await timeIntervalRepo.deleteAllSelected([model.id]);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure("Error")));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getTimeIntervalByMainTaskIdAndDateRange', () {
    test(
        '[timeIntervalRepo.getTimeIntervalByMainTaskIdAndDateRange] must call the [getTimeIntervalByMainTaskIdAndDateRange] of the [dataSource] then returns [Right(List<TimeIntervalEntity>)] data'
        'which will turn into [Right(List<TimeIntervalEntity>)] data',
        () async {
      when(() => mockDataSource.getTimeIntervalByMainTaskIdAndDateRange(
          mainTaskIds: [],
          startAt: startAt,
          endAt: endAt)).thenAnswer((_) async => const Right([]));

      final result = await timeIntervalRepo
          .getTimeIntervalByMainTaskIdAndDateRange(params);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<TimeIntervalEntity>>>());
      verify(() => mockDataSource.getTimeIntervalByMainTaskIdAndDateRange(
          mainTaskIds: [],
          startAt: startAt,
          endAt: endAt)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[timeIntervalRepo.getTimeIntervalByMainTaskIdAndDateRange.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getTimeIntervalByMainTaskIdAndDateRange(
              mainTaskIds: [], startAt: startAt, endAt: endAt))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await timeIntervalRepo
          .getTimeIntervalByMainTaskIdAndDateRange(params);

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<TimeIntervalEntity>>>());
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.getTimeIntervalByMainTaskIdAndDateRange(
          mainTaskIds: [],
          startAt: startAt,
          endAt: endAt)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getTimeIntervalBySubTaskId', () {
    test(
        '[timeIntervalRepo.getTimeIntervalBySubTaskId] must call the [getTimeIntervalBySubTaskId] of the [dataSource] then returns [Right(List<TimeIntervalEntity>)] data'
        'which will turn into [Right(List<TimeIntervalEntity>)] data',
        () async {
      when(() => mockDataSource.getTimeIntervalBySubTaskId('1'))
          .thenAnswer((_) async => const Right([]));

      final result = await timeIntervalRepo.getTimeIntervalBySubTaskId('1');

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<TimeIntervalEntity>>>());
      verify(() => mockDataSource.getTimeIntervalBySubTaskId('1'))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[timeIntervalRepo.getTimeIntervalBySubTaskId.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getTimeIntervalBySubTaskId('1'))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await timeIntervalRepo.getTimeIntervalBySubTaskId('1');

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<TimeIntervalEntity>>>());
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.getTimeIntervalBySubTaskId('1'))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
