import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/utils/constants/hive_box_names.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/core/utils/uuid.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_time_interval_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_time_interval_model.dart';

class MockHiveInit extends Mock
    implements HiveInitializer<HiveTimeIntervalModel> {}

void main() {
  late HiveTimeIntervalDataSourceImpl dataSource;
  late HiveInitializer<HiveTimeIntervalModel> mockHiveInit;
  late HiveTimeIntervalModel model;
  late List<String> keys;
  late DateTime startAt;
  late DateTime endAt;
  String boxName = HiveBoxConstants.TIME_INTERVAL_BOX;
  setUp(() {
    mockHiveInit = MockHiveInit();
    dataSource = HiveTimeIntervalDataSourceImpl(hiveBox: mockHiveInit);
    model = HiveTimeIntervalModel.empty();
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

  group('timeIntervalDataSource', () {
    test(
        '[timeIntervalDataSource.createEntity] must save entity to the box and returns [Right(null)] data',
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
        '[timeIntervalDataSource.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[timeIntervalDataSource.getEntities] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getEntities();

      expect(result.isRight(), true);
      expect(result,
          equals(const Right<Failure, List<HiveTimeIntervalModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[timeIntervalDataSource.getEntities.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getEntities();

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveTimeIntervalModel>>(
              HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[timeIntervalDataSource.getEntity] should retrieve entity by id from the box and returns [Right(HiveTimeIntervalModel)] data',
        () async {
      when(() => mockHiveInit.operator<HiveTimeIntervalModel>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => Right(model));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isRight(), true);
      expect(result, equals(Right<Failure, HiveTimeIntervalModel>(model)));
      verify(
        () => mockHiveInit.operator<HiveTimeIntervalModel>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[timeIntervalDataSource.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<HiveTimeIntervalModel>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, HiveTimeIntervalModel>(
              HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<HiveTimeIntervalModel>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[timeIntervalDataSource.updateEntity] must update entity in the box and returns [Right(null)] data',
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
        '[timeIntervalDataSource.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[timeIntervalDataSource.deleteEntity] must delete entity by id from the box and returns [Right(null)] data',
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
        '[timeIntervalDataSource.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[timeIntervalDataSource.deleteAllSelected] should delete from the box all the entities whose [ID] it has received and returns [Right(null)] data',
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
        '[timeIntervalDataSource.deleteAllSelected.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
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
        '[timeIntervalDataSource.getScheduledTimesByMainTaskId] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getScheduledTimesByMainTaskId('1');

      expect(result.isRight(), true);
      expect(result,
          equals(const Right<Failure, List<HiveTimeIntervalModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[timeIntervalDataSource.getScheduledTimesByMainTaskId.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getScheduledTimesByMainTaskId('1');

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveTimeIntervalModel>>(
              HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[timeIntervalDataSource.getTimeIntervalByMainTaskIdAndDateRange] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getTimeIntervalByMainTaskIdAndDateRange(
          mainTaskIds: keys, startAt: startAt, endAt: endAt);

      expect(result.isRight(), true);
      expect(result,
          equals(const Right<Failure, List<HiveTimeIntervalModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[timeIntervalDataSource.getScheduledTimesByMainTaskId.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getTimeIntervalByMainTaskIdAndDateRange(
          mainTaskIds: keys, startAt: startAt, endAt: endAt);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveTimeIntervalModel>>(
              HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[timeIntervalDataSource.getTimeIntervalBySubTaskId] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getTimeIntervalBySubTaskId('1');

      expect(result.isRight(), true);
      expect(result,
          equals(const Right<Failure, List<HiveTimeIntervalModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[timeIntervalDataSource.getTimeIntervalBySubTaskId.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getTimeIntervalBySubTaskId('1');

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveTimeIntervalModel>>(
              HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveTimeIntervalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });
  });
}
