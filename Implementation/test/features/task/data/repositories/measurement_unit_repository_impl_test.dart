import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_measurement_unit_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/measurement_unit_local_model.dart';
import 'package:zamaan/features/task/domain/entities/measurement_unit_entity.dart';


class MockDataSource extends Mock
    implements HiveMeasurementUnitDataSourceImpl {}

void main() {
  late HiveMeasurementUnitDataSourceImpl mockDataSource;
  late MeasurementUnitRepositoryImpl measurementUnitRepo;
  late MeasurementUnitLocalModel model;
  late MeasurementUnitEntity entity;
  setUp(() {
    mockDataSource = MockDataSource();
    measurementUnitRepo = MeasurementUnitRepositoryImpl(mockDataSource);
    entity = MeasurementUnitEntity.empty();
    model = MeasurementUnitLocalModel.fromEntity(entity);
  });

  group('createEntity', () {
    test(
        '[measurementUnitRepo.createEntity] must call the [createEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(
        () => mockDataSource.createEntity(
          newEntity: MeasurementUnitLocalModel.fromEntity(entity),
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await measurementUnitRepo.createEntity(newEntity: entity);

      expect(result.isRight(), true);
      expect(result, equals(const Right(null)));
      verify(
        () => mockDataSource.createEntity(
          newEntity: MeasurementUnitLocalModel.fromEntity(entity),
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[measurementUnitRepo.createEntity.failureTest] must return failure when createEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(
        () => mockDataSource.createEntity(
          newEntity: MeasurementUnitLocalModel.fromEntity(entity),
        ),
      ).thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await measurementUnitRepo.createEntity(newEntity: entity);

      expect(result.isLeft(), true);
      expect(result, equals(const Left(HiveFailure('Error'))));
      verify(
        () => mockDataSource.createEntity(
          newEntity: MeasurementUnitLocalModel.fromEntity(entity),
        ),
      ).called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntities', () {
    test(
        '[measurementUnitRepo.getEntities] must call the [getEntities] of the [dataSource] then returns [Right(List<MeasurementUnitEntity>)] data'
        'which will turn into [Right(List<MeasurementUnitEntity>)] data',
        () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Right([]));

      final result = await measurementUnitRepo.getEntities();

      expect(result.isRight(), true);
      expect(result, isA<Right<Failure, List<MeasurementUnitEntity>>>());
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[measurementUnitRepo.getEntities.failureTests] must return failure when getEntities fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntities())
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await measurementUnitRepo.getEntities();

      expect(result.isLeft(), true);
      expect(result, isA<Left<Failure, List<MeasurementUnitEntity>>>());
      expect(result, equals(const Left(HiveFailure('Error'))));
      verify(() => mockDataSource.getEntities())
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('getEntity', () {
    test(
        '[measurementUnitRepo.getEntity] must call the [getEntity] of the [dataSource] then returns [Right(MeasurementUnitEntity)] data'
        'which will turn into [Right(List<MeasurementUnitEntity>)] data',
        () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => Right(model));

      final result = await measurementUnitRepo.getEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, Right<Failure, MeasurementUnitEntity>(entity));
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[measurementUnitRepo.getEntity.failureTest] must return failure when getEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.getEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await measurementUnitRepo.getEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(
        result,
        equals(
          const Left<Failure, MeasurementUnitEntity>(
            HiveFailure('Error'),
          ),
        ),
      );
      verify(() => mockDataSource.getEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('updateEntity', () {
    test(
        '[measurementUnitRepo.updateEntity] must call the [updateEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Right(null));

      final result = await measurementUnitRepo.updateEntity(entity: entity);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[measurementUnitRepo.updateEntity.failureTest] must return failure when updateEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.updateEntity(entity: model))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await measurementUnitRepo.updateEntity(entity: entity);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure('Error')));
      verify(() => mockDataSource.updateEntity(entity: model))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteEntity', () {
    test(
        '[measurementUnitRepo.deleteEntity] must call the [deleteEntity] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Right(null));

      final result = await measurementUnitRepo.deleteEntity(id: entity.id);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[measurementUnitRepo.deleteEntity.failureTest] must return failure when deleteEntity fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteEntity(id: model.id))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await measurementUnitRepo.deleteEntity(id: entity.id);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure('Error')));
      verify(() => mockDataSource.deleteEntity(id: model.id))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('deleteAllSelected', () {
    test(
        '[measurementUnitRepo.deleteAllSelected] must call the [deleteAllSelected] of the [dataSource] then returns [Right(null)] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Right(null));

      final result = await measurementUnitRepo.deleteAllSelected([model.id]);

      expect(result.isRight(), true);
      expect(result, const Right(null));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
        '[measurementUnitRepo.deleteAllSelected.failureTest] must return failure when deleteAllSelected fails with [Left(HiveFailure("Error"))] data',
        () async {
      when(() => mockDataSource.deleteAllSelected([model.id]))
          .thenAnswer((_) async => const Left(HiveFailure('Error')));

      final result = await measurementUnitRepo.deleteAllSelected([model.id]);

      expect(result.isLeft(), true);
      expect(result, const Left(HiveFailure('Error')));
      verify(() => mockDataSource.deleteAllSelected([model.id]))
          .called(1); // Verify that get was only called once
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
