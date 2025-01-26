// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/core/services/hive_services.dart';
import 'package:zamaan/core/utils/uuid.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_goal_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/goal_local_model.dart';

class MockHiveInit extends Mock implements HiveServices<GoalLocalModel> {}

void main() {
  late HiveGoalDataSourceImpl dataSource;
  late HiveServices<GoalLocalModel> mockHiveInit;
  late GoalLocalModel model;
  late List<String> keys;
  const boxName = HiveBoxConstants.GOALS_BOX;
  setUp(() {
    mockHiveInit = MockHiveInit();
    dataSource = HiveGoalDataSourceImpl(hiveBox: mockHiveInit);
    model = GoalLocalModel.empty();
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
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await dataSource.createEntity(newEntity: model);

      expect(result.isRight(), true);
      expect(result, equals(const Right(null)));
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.createEntity(newEntity: model);

      expect(result.isLeft(), true);
      expect(result, equals(const Left(HiveFailure('Error'))));
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getEntities] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(
        () => mockHiveInit.operator<List<GoalLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getEntities();

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, List<GoalLocalModel>>([])));
      verify(
        () => mockHiveInit.operator<List<GoalLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getEntities.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(
        () => mockHiveInit.operator<List<GoalLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getEntities();

      expect(result.isLeft(), true);
      expect(
        result,
        equals(
          const Left<Failure, List<GoalLocalModel>>(HiveFailure('Error')),
        ),
      );
      verify(
        () => mockHiveInit.operator<List<GoalLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getEntity] should retrieve entity by id from the box and returns [Right(GoalLocalModel)] data',
        () async {
      when(
        () => mockHiveInit.operator<GoalLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => Right(model));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isRight(), true);
      expect(result, equals(Right<Failure, GoalLocalModel>(model)));
      verify(
        () => mockHiveInit.operator<GoalLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockHiveInit.operator<GoalLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isLeft(), true);
      expect(
        result,
        equals(const Left<Failure, GoalLocalModel>(HiveFailure('Error'))),
      );
      verify(
        () => mockHiveInit.operator<GoalLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getGoalBySubTaskId] should retrieve entity by id from the box and returns [Right(GoalLocalModel)] data',
        () async {
      when(
        () => mockHiveInit.operator<GoalLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => Right(model));

      final result = await dataSource.getGoalBySubTaskId('1');

      expect(result.isRight(), true);
      expect(result, equals(Right<Failure, GoalLocalModel>(model)));
      verify(
        () => mockHiveInit.operator<GoalLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getGoalBySubTaskId.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockHiveInit.operator<GoalLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getGoalBySubTaskId('1');

      expect(result.isLeft(), true);
      expect(
        result,
        equals(const Left<Failure, GoalLocalModel>(HiveFailure('Error'))),
      );
      verify(
        () => mockHiveInit.operator<GoalLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getGoalsByMainTaskId] should retrieve entity by id from the box and returns [Right(List<GoalLocalModel>)] data',
        () async {
      when(
        () => mockHiveInit.operator<List<GoalLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getGoalsByMainTaskId('1');

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, List<GoalLocalModel>>([])));
      verify(
        () => mockHiveInit.operator<List<GoalLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.getGoalsByMainTaskId.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockHiveInit.operator<List<GoalLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getGoalsByMainTaskId('1');

      expect(result.isLeft(), true);
      expect(
        result,
        equals(
          const Left<Failure, List<GoalLocalModel>>(HiveFailure('Error')),
        ),
      );
      verify(
        () => mockHiveInit.operator<List<GoalLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.updateEntity] must update entity in the box and returns [Right(null)] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await dataSource.updateEntity(entity: model);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, void>(null)));
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.updateEntity(entity: model);

      expect(result.isLeft(), true);
      expect(result, equals(const Left<Failure, void>(HiveFailure('Error'))));
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.deleteEntity] must delete entity by id from the box and returns [Right(null)] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await dataSource.deleteEntity(id: model.id);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, void>(null)));
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.deleteEntity(id: model.id);

      expect(result.isLeft(), true);
      expect(result, equals(const Left<Failure, void>(HiveFailure('Error'))));
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.deleteAllSelected] should delete from the box all the entities whose [ID] it has received and returns [Right(null)] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await dataSource.deleteAllSelected(keys);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, void>(null)));
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[goalDataSource.deleteAllSelected.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.deleteAllSelected(keys);

      expect(result.isLeft(), true);
      expect(result, equals(const Left<Failure, void>(HiveFailure('Error'))));
      verify(
        () => mockHiveInit.operator<void>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });
  });
}
