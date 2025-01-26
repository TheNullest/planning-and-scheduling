// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/constants/hive_box_names.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/core/services/hive_services.dart';
import 'package:zamaan/core/utils/uuid.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_category_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/category_local_model.dart';

class MockHiveInit extends Mock implements HiveServices<CategoryLocalModel> {}

void main() {
  late HiveCategoryDataSourceImpl dataSource;
  late HiveServices<CategoryLocalModel> mockHiveInit;
  late CategoryLocalModel model;
  late List<String> keys;
  const boxName = HiveBoxConstants.CATEGOREIS_BOX;
  setUp(() {
    mockHiveInit = MockHiveInit();
    dataSource = HiveCategoryDataSourceImpl(hiveBox: mockHiveInit);
    model = CategoryLocalModel.empty();
    keys = [
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
    ];
  });

  group('categoryDataSource', () {
    test(
        '[categoryDataSource.createEntity] must save entity to the box and returns [Right(null)] data',
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
        '[categoryDataSource.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[categoryDataSource.getEntities] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(
        () => mockHiveInit.operator<List<CategoryLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getEntities();

      expect(result.isRight(), true);
      expect(
        result,
        equals(const Right<Failure, List<CategoryLocalModel>>([])),
      );
      verify(
        () => mockHiveInit.operator<List<CategoryLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[categoryDataSource.getEntities.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(
        () => mockHiveInit.operator<List<CategoryLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getEntities();

      expect(result.isLeft(), true);
      expect(
        result,
        equals(
          const Left<Failure, List<CategoryLocalModel>>(
            HiveFailure('Error'),
          ),
        ),
      );
      verify(
        () => mockHiveInit.operator<List<CategoryLocalModel>>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[categoryDataSource.getEntity] should retrieve entity by id from the box and returns [Right(CategoryLocalModel)] data',
        () async {
      when(
        () => mockHiveInit.operator<CategoryLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => Right(model));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isRight(), true);
      expect(result, equals(Right<Failure, CategoryLocalModel>(model)));
      verify(
        () => mockHiveInit.operator<CategoryLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[categoryDataSource.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockHiveInit.operator<CategoryLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isLeft(), true);
      expect(
        result,
        equals(const Left<Failure, CategoryLocalModel>(HiveFailure('Error'))),
      );
      verify(
        () => mockHiveInit.operator<CategoryLocalModel>(
          job: any(named: 'job'),
          boxName: boxName,
        ),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[categoryDataSource.updateEntity] must update entity in the box and returns [Right(null)] data',
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
        '[categoryDataSource.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[categoryDataSource.deleteEntity] must delete entity by id from the box and returns [Right(null)] data',
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
        '[categoryDataSource.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[categoryDataSource.deleteAllSelected] should delete from the box all the entities whose [ID] it has received and returns [Right(null)] data',
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
        '[categoryDataSource.deleteAllSelected.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
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
