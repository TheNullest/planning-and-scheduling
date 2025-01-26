// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/core/services/hive_services.dart';
import 'package:zamaan/core/utils/uuid.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_measurement_unit_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/measurement_unit_local_model.dart';

class MockHiveInit extends Mock
    implements HiveServices<MeasurementUnitLocalModel> {}

void main() {
  late HiveMeasurementUnitDataSourceImpl dataSource;
  late HiveServices<MeasurementUnitLocalModel> mockHiveInit;
  late MeasurementUnitLocalModel model;
  late List<String> keys;
  const boxName = HiveBoxConstants.MEASUREMENT_UNITS_BOX;
  setUp(() {
    mockHiveInit = MockHiveInit();
    dataSource = HiveMeasurementUnitDataSourceImpl(hiveBox: mockHiveInit);
    model = MeasurementUnitLocalModel.empty();
    keys = [
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
    ];
  });

  group('measurementUnitDataSource', () {
    test(
        '[measurementUnitDataSource.createEntity] must save entity to the box and returns [Right(null)] data',
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
        '[measurementUnitDataSource.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[measurementUnitDataSource.getEntities] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(
        () => mockHiveInit.operator<List<MeasurementUnitLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getEntities();

      expect(result.isRight(), true);
      expect(
        result,
        equals(const Right<Failure, List<MeasurementUnitLocalModel>>([])),
      );
      verify(
        () => mockHiveInit.operator<List<MeasurementUnitLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[measurementUnitDataSource.getEntities.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(
        () => mockHiveInit.operator<List<MeasurementUnitLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getEntities();

      expect(result.isLeft(), true);
      expect(
        result,
        equals(
          const Left<Failure, List<MeasurementUnitLocalModel>>(
            HiveFailure('Error'),
          ),
        ),
      );
      verify(
        () => mockHiveInit.operator<List<MeasurementUnitLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[measurementUnitDataSource.getEntity] should retrieve entity by id from the box and returns [Right(MeasurementUnitLocalModel)] data',
        () async {
      when(
        () => mockHiveInit.operator<MeasurementUnitLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => Right(model));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isRight(), true);
      expect(result, equals(Right<Failure, MeasurementUnitLocalModel>(model)));
      verify(
        () => mockHiveInit.operator<MeasurementUnitLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[measurementUnitDataSource.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockHiveInit.operator<MeasurementUnitLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isLeft(), true);
      expect(
        result,
        equals(
          const Left<Failure, MeasurementUnitLocalModel>(
            HiveFailure('Error'),
          ),
        ),
      );
      verify(
        () => mockHiveInit.operator<MeasurementUnitLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[measurementUnitDataSource.updateEntity] must update entity in the box and returns [Right(null)] data',
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
        '[measurementUnitDataSource.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[measurementUnitDataSource.deleteEntity] must delete entity by id from the box and returns [Right(null)] data',
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
        '[measurementUnitDataSource.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[measurementUnitDataSource.deleteAllSelected] should delete from the box all the entities whose [ID] it has received and returns [Right(null)] data',
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
        '[measurementUnitDataSource.deleteAllSelected.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
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
