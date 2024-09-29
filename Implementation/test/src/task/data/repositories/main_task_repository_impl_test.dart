import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/core/utils/enums/enums.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_main_task_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_main_task_model.dart';
import 'package:zamaan/features/task/data/repositories/main_task_repository_impl.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';

import '../../../auth/domain/usecases/_authentication_repository.mock.dart';

class MockDataSource extends Mock implements HiveMainTaskDataSourceImpl {}

void main() {
  late HiveMainTaskDataSourceImpl mockDataSource;
  late MainTaskRepositoryImpl mainTaskRepo;
  late HiveMainTaskModel model;
  late MainTaskEntity entity;
  late DateTime dueDate;
  setUp(() {
    mockDataSource = MockDataSource();
    mainTaskRepo = MainTaskRepositoryImpl(mockDataSource);
    entity = MainTaskEntity.empty();
    model = HiveMainTaskModel.fromEntity(entity);
    dueDate = DateTime.now();
  });

  group('createEntity', () {
    test(
        '[mainTaskRepo.createEntity] must call the [createEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.createEntity(
              newEntity: HiveMainTaskModel.fromEntity(entity)))
          .thenAnswer((_) async => const Right(null));

      final result = await mainTaskRepo.createEntity(newEntity: entity);

      expect(result.isRight(), true);
      expect(result, equals(const Right(null)));
      verify(() => mockDataSource.createEntity(
              newEntity: HiveMainTaskModel.fromEntity(entity)))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[mainTaskRepo.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.createEntity(
              newEntity: HiveMainTaskModel.fromEntity(entity)))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await mainTaskRepo.createEntity(newEntity: entity);

      expect(result.isLeft(), true);
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.createEntity(
              newEntity: HiveMainTaskModel.fromEntity(entity)))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntities', () {
    test(
        '[mainTaskRepo.getEntities] must call the [getEntities] of the [dataSource] then returns [Right(List<MainTaskEntity>)] data'
        'which will turn into [Right(List<MainTaskEntity>)] data', () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Right([]));

      final result = await mainTaskRepo.getEntities();

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<MainTaskEntity>>>());
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[mainTaskRepo.getEntities.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await mainTaskRepo.getEntities();

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<MainTaskEntity>>>());
      expect(result, equals(const Left(HiveFailure("Error"))));
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntity', () {
    test(
        '[mainTaskRepo.getEntity] must call the [getEntity] of the [dataSource] then returns [Right(MainTaskEntity)] data'
        'which will turn into [Right(List<MainTaskEntity>)] data', () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => Right(model));

      final result = await mainTaskRepo.getEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, Right<Failure, MainTaskEntity>(entity));
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[mainTaskRepo.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await mainTaskRepo.getEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(result,
          equals(const Left<Failure, MainTaskEntity>(HiveFailure("Error"))));
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('updateEntity', () {
    test(
        '[mainTaskRepo.updateEntity] must call the [updateEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Right(null));

      final result = await mainTaskRepo.updateEntity(entity: entity);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[mainTaskRepo.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await mainTaskRepo.updateEntity(entity: entity);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure("Error")));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteEntity', () {
    test(
        '[mainTaskRepo.deleteEntity] must call the [deleteEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Right(null));

      final result = await mainTaskRepo.deleteEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[mainTaskRepo.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await mainTaskRepo.deleteEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure("Error")));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteAllSelected', () {
    test(
        '[mainTaskRepo.deleteAllSelected] must call the [deleteAllSelected] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Right(null));

      final result = await mainTaskRepo.deleteAllSelected([model.id]);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[mainTaskRepo.deleteAllSelected.failureTest] must return failure when deleteAllSelected fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await mainTaskRepo.deleteAllSelected([model.id]);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure("Error")));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getMainTasksByCategories', () {
    test(
        '[mainTaskRepo.getMainTasksByCategories] must call the [getMainTasksByCategories] of the [dataSource] then returns [Right(List<HiveMainTaskModel>)] data'
        'which will turn into [Right(List<MainTaskEntity>)] data', () async {
      when(() => mockDataSource.getMainTasksByCategories([]))
          .thenAnswer((_) async => Right([model]));

      final result = await mainTaskRepo.getMainTasksByCategories([]);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<MainTaskEntity>>>());
      // expect(result, equals(Right<Failure, List<MainTaskEntity>>([entity])));
      verify(() => mockDataSource.getMainTasksByCategories([]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[mainTaskRepo.getMainTasksByCategories.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getMainTasksByCategories([]))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await mainTaskRepo.getMainTasksByCategories([]);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(
              const Left<Failure, List<MainTaskEntity>>(HiveFailure("Error"))));
      verify(() => mockDataSource.getMainTasksByCategories([]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getMainTasksByDueDate', () {
    test(
        '[mainTaskRepo.getMainTasksByDueDate] must call the [getMainTasksByDueDate] of the [dataSource] then returns [Right(List<HiveMainTaskModel>)] data'
        'which will turn into [Right(List<MainTaskEntity>)] data', () async {
      when(() => mockDataSource.getMainTasksByDueDate(dueDate))
          .thenAnswer((_) async => const Right([]));

      final result = await mainTaskRepo.getMainTasksByDueDate(dueDate);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<MainTaskEntity>>>());
      verify(() => mockDataSource.getMainTasksByDueDate(dueDate))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[mainTaskRepo.getMainTasksByDueDate.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getMainTasksByDueDate(dueDate))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await mainTaskRepo.getMainTasksByDueDate(dueDate);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(
              const Left<Failure, List<MainTaskEntity>>(HiveFailure("Error"))));
      verify(() => mockDataSource.getMainTasksByDueDate(dueDate))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getMainTasksByPriority', () {
    test(
        '[mainTaskRepo.getMainTasksByPriority] must call the [getMainTasksByPriority] of the [dataSource] then returns [Right(List<HiveMainTaskModel>)] data'
        'which will turn into [Right(List<MainTaskEntity>)] data', () async {
      when(() => mockDataSource.getMainTasksByPriority(Priority.high))
          .thenAnswer((_) async => const Right([]));

      final result = await mainTaskRepo.getMainTasksByPriority(Priority.high);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<MainTaskEntity>>>());
      verify(() => mockDataSource.getMainTasksByPriority(Priority.high))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[mainTaskRepo.getMainTasksByPriority.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getMainTasksByPriority(Priority.high))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await mainTaskRepo.getMainTasksByPriority(Priority.high);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(
              const Left<Failure, List<MainTaskEntity>>(HiveFailure("Error"))));
      verify(() => mockDataSource.getMainTasksByPriority(Priority.high))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getMainTasksByStatus', () {
    test(
        '[mainTaskRepo.getMainTasksByStatus] must call the [getMainTasksByStatus] of the [dataSource] then returns [Right(List<HiveMainTaskModel>)] data'
        'which will turn into [Right(List<MainTaskEntity>)] data', () async {
      when(() => mockDataSource.getMainTasksByStatus(Status.inProgress))
          .thenAnswer((_) async => const Right([]));

      final result = await mainTaskRepo.getMainTasksByStatus(Status.inProgress);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<MainTaskEntity>>>());
      verify(() => mockDataSource.getMainTasksByStatus(Status.inProgress))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[mainTaskRepo.getMainTasksByStatus.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getMainTasksByStatus(Status.inProgress))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await mainTaskRepo.getMainTasksByStatus(Status.inProgress);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(
              const Left<Failure, List<MainTaskEntity>>(HiveFailure("Error"))));
      verify(() => mockDataSource.getMainTasksByStatus(Status.inProgress))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getMainTasksByTags', () {
    test(
        '[mainTaskRepo.getMainTasksByTags] must call the [getMainTasksByTags] of the [dataSource] then returns [Right(List<HiveMainTaskModel>)] data'
        'which will turn into [Right(List<MainTaskEntity>)] data', () async {
      when(() => mockDataSource.getMainTasksByTags([]))
          .thenAnswer((_) async => const Right([]));

      final result = await mainTaskRepo.getMainTasksByTags([]);

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<MainTaskEntity>>>());
      verify(() => mockDataSource.getMainTasksByTags([]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[mainTaskRepo.getMainTasksByTags.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getMainTasksByTags([]))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await mainTaskRepo.getMainTasksByTags([]);

      expect(result.isLeft(), true);
      expect(
          result,
          equals(
              const Left<Failure, List<MainTaskEntity>>(HiveFailure("Error"))));
      verify(() => mockDataSource.getMainTasksByTags([]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getMainTaskByTaskSchedulerId', () {
    test(
        '[mainTaskRepo.getMainTaskByTaskSchedulerId] must call the [getMainTaskByTaskSchedulerId] of the [dataSource] then returns [Right(List<HiveMainTaskModel>)] data'
        'which will turn into [Right(List<MainTaskEntity>)] data', () async {
      when(() => mockDataSource.getMainTaskByTaskSchedulerId('1'))
          .thenAnswer((_) async => Right(model));

      final result = await mainTaskRepo.getMainTaskByTaskSchedulerId('1');

      expect(result.isRight(), true);
      expect(result, equals(Right<Failure, MainTaskEntity>(entity)));
      verify(() => mockDataSource.getMainTaskByTaskSchedulerId('1'))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[mainTaskRepo.getMainTaskByTaskSchedulerId.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getMainTaskByTaskSchedulerId('1'))
          .thenAnswer((_) async => const Left(HiveFailure("Error")));

      final result = await mainTaskRepo.getMainTaskByTaskSchedulerId('1');

      expect(result.isLeft(), true);
      expect(
          result,
          equals(
              const Left<Failure, List<MainTaskEntity>>(HiveFailure("Error"))));
      verify(() => mockDataSource.getMainTaskByTaskSchedulerId('1'))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
