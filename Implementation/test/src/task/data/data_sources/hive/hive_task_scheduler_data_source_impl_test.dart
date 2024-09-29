import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/core/utils/enums/enums.dart';
import 'package:zamaan/core/utils/uuid.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_task_scheduler_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_task_scheduler_model.dart';

class MockHiveInit extends Mock
    implements HiveInitializer<HiveTaskSchedulerModel> {}

void main() {
  late HiveTaskSchedulerDataSourceImpl dataSource;
  late HiveInitializer<HiveTaskSchedulerModel> mockHiveInit;
  late HiveTaskSchedulerModel model;
  late List<String> keys;
  late DateTime startAt;
  late DateTime endAt;
  String boxName = HiveBoxConstants.TASK_SCHEDULERS_BOX;
  setUp(() {
    mockHiveInit = MockHiveInit();
    dataSource = HiveTaskSchedulerDataSourceImpl(hiveBox: mockHiveInit);
    model = HiveTaskSchedulerModel.empty();
    startAt = DateTime(2024, 01, 01);
    endAt = DateTime.now();
    keys = [
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
    ];
  });

  group('taskSchedulersDataSource', () {
    test(
        '[taskSchedulersDataSource.createEntity] must save entity to the box and returns [Right(null)] data',
        () async {
      when(() => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right(null));

      final result = await dataSource.createEntity(newEntity: model);

      expect(result.isRight(), true);
      expect(result, equals(const Right(null)));
      verify(() => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<void>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.createEntity(newEntity: model);

      expect(result.isLeft(), true);
      expect(result, equals(const Left(HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getEntities] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getEntities();

      expect(result.isRight(), true);
      expect(result,
          equals(const Right<Failure, List<HiveTaskSchedulerModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getEntities.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getEntities();

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveTaskSchedulerModel>>(
              HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getEntity] should retrieve entity by id from the box and returns [Right(HiveTaskSchedulerModel)] data',
        () async {
      when(() => mockHiveInit.operator<HiveTaskSchedulerModel>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => Right(model));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isRight(), true);
      expect(result, equals(Right<Failure, HiveTaskSchedulerModel>(model)));
      verify(
        () => mockHiveInit.operator<HiveTaskSchedulerModel>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<HiveTaskSchedulerModel>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, HiveTaskSchedulerModel>(
              HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<HiveTaskSchedulerModel>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.updateEntity] must update entity in the box and returns [Right(null)] data',
        () async {
      when(() => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right(null));

      final result = await dataSource.updateEntity(entity: model);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, void>(null)));
      verify(() => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<void>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.updateEntity(entity: model);

      expect(result.isLeft(), true);
      expect(result, equals(const Left<Failure, void>(HiveFailure("Error"))));
      verify(() => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.deleteEntity] must delete entity by id from the box and returns [Right(null)] data',
        () async {
      when(() => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right(null));

      final result = await dataSource.deleteEntity(id: model.id);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, void>(null)));
      verify(
        () => mockHiveInit.operator<void>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<void>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.deleteEntity(id: model.id);

      expect(result.isLeft(), true);
      expect(result, equals(const Left<Failure, void>(HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<void>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.deleteAllSelected] should delete from the box all the entities whose [ID] it has received and returns [Right(null)] data',
        () async {
      when(() => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right(null));

      final result = await dataSource.deleteAllSelected(keys);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, void>(null)));
      verify(
        () => mockHiveInit.operator<void>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.deleteAllSelected.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<void>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.deleteAllSelected(keys);

      expect(result.isLeft(), true);
      expect(result, equals(const Left<Failure, void>(HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<void>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersByMainTaskIdsAndDateRange] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result =
          await dataSource.getTaskSchedulersByMainTaskIdsAndDateRange(
              mainTaskIds: keys, startAt: startAt, endAt: endAt);

      expect(result.isRight(), true);
      expect(result,
          equals(const Right<Failure, List<HiveTaskSchedulerModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersByMainTaskIdsAndDateRange.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result =
          await dataSource.getTaskSchedulersByMainTaskIdsAndDateRange(
              mainTaskIds: keys, startAt: startAt, endAt: endAt);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveTaskSchedulerModel>>(
              HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersByEndTime] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getTaskSchedulersByEndTime(endAt);

      expect(result.isRight(), true);
      expect(result,
          equals(const Right<Failure, List<HiveTaskSchedulerModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersByEndTime.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getTaskSchedulersByEndTime(endAt);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveTaskSchedulerModel>>(
              HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersByMainTaskId] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getTaskSchedulersByMainTaskId('1');

      expect(result.isRight(), true);
      expect(result,
          equals(const Right<Failure, List<HiveTaskSchedulerModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersByMainTaskId.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getTaskSchedulersByMainTaskId('1');

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveTaskSchedulerModel>>(
              HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersByRepetitionType] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource
          .getTaskSchedulersByRepetitionType(RepetitionType.per);

      expect(result.isRight(), true);
      expect(result,
          equals(const Right<Failure, List<HiveTaskSchedulerModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersByRepetitionType.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource
          .getTaskSchedulersByRepetitionType(RepetitionType.per);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveTaskSchedulerModel>>(
              HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersBySpecificTimes] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getTaskSchedulersBySpecificTimes([]);

      expect(result.isRight(), true);
      expect(result,
          equals(const Right<Failure, List<HiveTaskSchedulerModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersBySpecificTimes.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getTaskSchedulersBySpecificTimes([]);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveTaskSchedulerModel>>(
              HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersByStartTime] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getTaskSchedulersByStartTime(startAt);

      expect(result.isRight(), true);
      expect(result,
          equals(const Right<Failure, List<HiveTaskSchedulerModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersByStartTime.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getTaskSchedulersByStartTime(startAt);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveTaskSchedulerModel>>(
              HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersByTimeUnit] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getTaskSchedulersByTimeUnit(TimeUnit.day);

      expect(result.isRight(), true);
      expect(result,
          equals(const Right<Failure, List<HiveTaskSchedulerModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersByTimeUnit.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getTaskSchedulersByTimeUnit(TimeUnit.day);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveTaskSchedulerModel>>(
              HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersWithinDateRange] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getTaskSchedulersWithinDateRange(
          startDate: startAt, endDate: endAt);

      expect(result.isRight(), true);
      expect(result,
          equals(const Right<Failure, List<HiveTaskSchedulerModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[taskSchedulersDataSource.getTaskSchedulersWithinDateRange.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getTaskSchedulersWithinDateRange(
          startDate: startAt, endDate: endAt);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveTaskSchedulerModel>>(
              HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveTaskSchedulerModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });
  });
}
