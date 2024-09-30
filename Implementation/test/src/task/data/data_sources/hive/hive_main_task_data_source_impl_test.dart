import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/utils/constants/hive_box_names.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/core/initializers/hive_initializer.dart';
import 'package:zamaan/core/utils/enums/enums.dart';
import 'package:zamaan/core/utils/uuid.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_main_task_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_main_task_model.dart';

class MockHiveInit extends Mock implements HiveInitializer<HiveMainTaskModel> {}

void main() {
  late HiveMainTaskDataSourceImpl dataSource;
  late HiveInitializer<HiveMainTaskModel> mockHiveInit;
  late HiveMainTaskModel model;
  late List<String> keys;
  String boxName = HiveBoxConstants.MAINTASKS_BOX;
  setUp(() {
    mockHiveInit = MockHiveInit();
    dataSource = HiveMainTaskDataSourceImpl(hiveBox: mockHiveInit);
    model = HiveMainTaskModel.empty();
    keys = [
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
      uuidGenerator(),
    ];
  });

  group('mainTaskDataSource', () {
    test(
        '[mainTaskDataSource.createEntity] must save entity to the box and returns [Right(null)] data',
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
        '[mainTaskDataSource.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[mainTaskDataSource.getEntities] should retrieve all entities from the box [Right([])] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveMainTaskModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getEntities();

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, List<HiveMainTaskModel>>([])));
      verify(() => mockHiveInit.operator<List<HiveMainTaskModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.getEntities.failureTest] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data ',
        () async {
      when(() => mockHiveInit.operator<List<HiveMainTaskModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await dataSource.getEntities();

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveMainTaskModel>>(
              HiveFailure('Error'))));
      verify(() => mockHiveInit.operator<List<HiveMainTaskModel>>(
          job: any(named: 'job'),
          boxName: boxName)).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.getEntity] should retrieve entity by id from the box and returns [Right(HiveMainTaskModel)] data',
        () async {
      when(() => mockHiveInit.operator<HiveMainTaskModel>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => Right(model));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isRight(), true);
      expect(result, equals(Right<Failure, HiveMainTaskModel>(model)));
      verify(
        () => mockHiveInit.operator<HiveMainTaskModel>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<HiveMainTaskModel>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.getEntity(id: model.id);

      expect(result.isLeft(), true);
      expect(result,
          equals(const Left<Failure, HiveMainTaskModel>(HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<HiveMainTaskModel>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.updateEntity] must update entity in the box and returns [Right(null)] data',
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
        '[mainTaskDataSource.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[mainTaskDataSource.deleteEntity] must delete entity by id from the box and returns [Right(null)] data',
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
        '[mainTaskDataSource.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
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
        '[mainTaskDataSource.deleteAllSelected] should delete from the box all the entities whose [ID] it has received and returns [Right(null)] data',
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
        '[mainTaskDataSource.deleteAllSelected.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
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
        '[mainTaskDataSource.getMainTasksByCategories] should delete from the box all the entities whose [ID] it has received and returns [Right(List<HiveMainTaskModel>)] data',
        () async {
      when(() => mockHiveInit.operator<List<HiveMainTaskModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getMainTasksByCategories(keys);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, List<HiveMainTaskModel>>([])));
      verify(
        () => mockHiveInit.operator<List<HiveMainTaskModel>>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.getMainTasksByCategories.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<List<HiveMainTaskModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.getMainTasksByCategories(keys);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveMainTaskModel>>(
              HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<List<HiveMainTaskModel>>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.getMainTasksByDueDate] should delete from the box all the entities whose [ID] it has received and returns [Right(List<HiveMainTaskModel>)] data',
        () async {
      when(() => mockHiveInit.operator<List<HiveMainTaskModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getMainTasksByDueDate(DateTime.now());

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, List<HiveMainTaskModel>>([])));
      verify(
        () => mockHiveInit.operator<List<HiveMainTaskModel>>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.getMainTasksByDueDate.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<List<HiveMainTaskModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.getMainTasksByDueDate(DateTime.now());

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveMainTaskModel>>(
              HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<List<HiveMainTaskModel>>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.getMainTasksByPriority] should delete from the box all the entities whose [ID] it has received and returns [Right(List<HiveMainTaskModel>)] data',
        () async {
      when(() => mockHiveInit.operator<List<HiveMainTaskModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getMainTasksByPriority(Priority.critical);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, List<HiveMainTaskModel>>([])));
      verify(
        () => mockHiveInit.operator<List<HiveMainTaskModel>>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.getMainTasksByPriority.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<List<HiveMainTaskModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.getMainTasksByPriority(Priority.critical);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveMainTaskModel>>(
              HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<List<HiveMainTaskModel>>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.getMainTasksByStatus] should delete from the box all the entities whose [ID] it has received and returns [Right(List<HiveMainTaskModel>)] data',
        () async {
      when(() => mockHiveInit.operator<List<HiveMainTaskModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getMainTasksByStatus(Status.completed);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, List<HiveMainTaskModel>>([])));
      verify(
        () => mockHiveInit.operator<List<HiveMainTaskModel>>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.getMainTasksByStatus.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<List<HiveMainTaskModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.getMainTasksByStatus(Status.completed);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveMainTaskModel>>(
              HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<List<HiveMainTaskModel>>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.getMainTasksByTags] should delete from the box all the entities whose [ID] it has received and returns [Right(List<HiveMainTaskModel>)] data',
        () async {
      when(() => mockHiveInit.operator<List<HiveMainTaskModel>>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => const Right([]));

      final result = await dataSource.getMainTasksByTags([]);

      expect(result.isRight(), true);
      expect(result, equals(const Right<Failure, List<HiveMainTaskModel>>([])));
      verify(
        () => mockHiveInit.operator<List<HiveMainTaskModel>>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.getMainTasksByTags.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<List<HiveMainTaskModel>>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.getMainTasksByTags([]);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(const Left<Failure, List<HiveMainTaskModel>>(
              HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<List<HiveMainTaskModel>>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.getMainTaskByTaskSchedulerId] should delete from the box all the entities whose [ID] it has received and returns [Right(List<HiveMainTaskModel>)] data',
        () async {
      when(() => mockHiveInit.operator<HiveMainTaskModel>(
          job: any(named: 'job'),
          boxName: boxName)).thenAnswer((_) async => Right(model));

      final result = await dataSource.getMainTaskByTaskSchedulerId('1');

      expect(result.isRight(), true);
      expect(result, equals(Right<Failure, HiveMainTaskModel>(model)));
      verify(
        () => mockHiveInit.operator<HiveMainTaskModel>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });

    test(
        '[mainTaskDataSource.getMainTaskByTaskSchedulerId.failureTest] must return failure when delete fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockHiveInit.operator<HiveMainTaskModel>(
              job: any(named: 'job'), boxName: boxName))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await dataSource.getMainTaskByTaskSchedulerId('1');

      expect(result.isLeft(), true);
      expect(result,
          equals(const Left<Failure, HiveMainTaskModel>(HiveFailure("Error"))));
      verify(
        () => mockHiveInit.operator<HiveMainTaskModel>(
            job: any(named: 'job'), boxName: boxName),
      ).called(1); // Verify that get was only called once with the correct ID
      verifyNoMoreInteractions(mockHiveInit);
    });
  });
}
