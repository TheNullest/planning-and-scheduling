import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/utils/constants/hive_box_names.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/core/utils/uuid.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_goal_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_goal_model.dart';

class MockHiveInit extends Mock implements HiveInitializer<HiveGoalModel> {}

void main() {
  late HiveGoalDataSourceImpl dataSource;
  late HiveInitializer<HiveGoalModel> mockHiveInit;
  late HiveGoalModel model;
  late List<String> keys;
  String boxName = HiveBoxConstants.GOALS_BOX;
  setUp(() {
    mockHiveInit = MockHiveInit();
    dataSource = HiveGoalDataSourceImpl(hiveBox: mockHiveInit);
    model = HiveGoalModel.empty();
    keys = [
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
    ];
  });

  group('goalDataSource', () {
    test(
        '[goalDataSource.createEntity] must save entity to the box and returns [Right(null)] data',
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
        '[goalDataSource.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[goalDataSource.getEntities] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveGoalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getEntities();

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, List<HiveGoalModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveGoalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getEntities.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveGoalModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getEntities();

      expect(result.isLeft(), true);
      expect(
          result,
          equals(
              const Left<Failure, List<HiveGoalModel>>(HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveGoalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getEntity] should retrieve entity by id from the box and returns [Right(HiveGoalModel)] data',
        () async {
      when(() => mockHiveInit.operator<HiveGoalModel>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => Right(model));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isRight(), true);
      expect(result, equals(Right<Failure, HiveGoalModel>(model)));
      verify(
        () => mockHiveInit.operator<HiveGoalModel>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<HiveGoalModel>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isLeft(), true);
      expect(result,
          equals(const Left<Failure, HiveGoalModel>(HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<HiveGoalModel>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getGoalBySubTaskId] should retrieve entity by id from the box and returns [Right(HiveGoalModel)] data',
        () async {
      when(() => mockHiveInit.operator<HiveGoalModel>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => Right(model));

      final result = await dataSource.getGoalBySubTaskId('1');

      expect(result.isRight(), true);
      expect(result, equals(Right<Failure, HiveGoalModel>(model)));
      verify(
        () => mockHiveInit.operator<HiveGoalModel>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getGoalBySubTaskId.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<HiveGoalModel>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.getGoalBySubTaskId('1');

      expect(result.isLeft(), true);
      expect(result,
          equals(const Left<Failure, HiveGoalModel>(HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<HiveGoalModel>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getGoalsByMainTaskId] should retrieve entity by id from the box and returns [Right(List<HiveGoalModel>)] data',
        () async {
      when(() => mockHiveInit.operator<List<HiveGoalModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getGoalsByMainTaskId('1');

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, List<HiveGoalModel>>([])));
      verify(
        () => mockHiveInit.operator<List<HiveGoalModel>>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getGoalsByMainTaskId.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<List<HiveGoalModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.getGoalsByMainTaskId('1');

      expect(result.isLeft(), true);
      expect(
          result,
          equals(
              const Left<Failure, List<HiveGoalModel>>(HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<List<HiveGoalModel>>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.updateEntity] must update entity in the box and returns [Right(null)] data',
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
        '[goalDataSource.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[goalDataSource.deleteEntity] must delete entity by id from the box and returns [Right(null)] data',
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
        '[goalDataSource.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[goalDataSource.deleteAllSelected] should delete from the box all the entities whose [ID] it has received and returns [Right(null)] data',
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
        '[goalDataSource.deleteAllSelected.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
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
  });
}
