import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/sub_task_repository.dart';
import 'package:zamaan/features/task/domain/usecases/sub_task_usecases/create_sub_task_usecase.dart';

import '_sub_task_repository.mock.dart';

void main() {
  late CreateSubTaskUsecase usecase;
  late SubTaskRepository mockedRepository;

  setUp(() {
    mockedRepository = MockSubTaskRepo();
    usecase = CreateSubTaskUsecase(mockedRepository);
  });

  final param = SubTaskEntity.empty();
  test('[subTask.createUsecase] must call the [SubTaskRepository.createEntity]',
      () async {
    // Arrange
    // Act
    when(() => mockedRepository.createEntity(newEntity: param))
        .thenAnswer((_) async => const Right(null));
    final actualResult = await usecase(param);

    // Assert
    expect(actualResult.isRight(), true);

    expect(actualResult, equals(const Right<Failure, void>(null)));
    verify(() => mockedRepository.createEntity(newEntity: param)).called(1);
    verifyNoMoreInteractions(mockedRepository);
  });

  test(
      '[subTask.createUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when createUsecase fails',
      () async {
    // Arrange
    // Act
    when(() => mockedRepository.createEntity(newEntity: param))
        .thenAnswer((_) async => const Left(HiveFailure('Error')));
    final actualResult = await usecase(param);

    // Assert
    expect(actualResult.isLeft(), true);
    expect(actualResult, equals(const Left(HiveFailure('Error'))));
    verify(() => mockedRepository.createEntity(newEntity: param)).called(1);
    verifyNoMoreInteractions(mockedRepository);
  });
}
