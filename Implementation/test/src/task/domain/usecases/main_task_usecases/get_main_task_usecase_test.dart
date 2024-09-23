import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';
import 'package:zamaan/features/task/domain/usecases/main_task_usecases/get_main_task_usecase.dart';

import '_main_task_repository.mock.dart';

void main() {
  late MainTaskRepository mockedRepo;
  late GetMainTaskUsecase usecase;
  late MainTaskEntity param;

  setUp(() {
    mockedRepo = MockMainTaskRepo();
    usecase = GetMainTaskUsecase(mockedRepo);
    param = MainTaskEntity.empty();
  });

  test(
      '[mainTask.getUsecase] must call the [MainTaskRepository.getEntity] and return [MainTaskEntity]',
      () async {
    //Arrange
    when(() => mockedRepo.getEntity(id: param.id))
        .thenAnswer((_) async => Right(param));

    // Act
    final result = await usecase(param.id);

    // Assert
    expect(result.isRight(), true);

    expect(result, equals(Right<Failure, MainTaskEntity>(param)));
    verify(() => mockedRepo.getEntity(id: param.id)).called(1);
    verifyNoMoreInteractions(mockedRepo);
  });

  test(
      '[mainTask.getUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when getUsecase fails',
      () async {
    //Arrange
    when(() => mockedRepo.getEntity(id: param.id))
        .thenAnswer((_) async => const Left(HiveFailure("Error")));

    // Act
    final result = await usecase(param.id);

    // Assert
    expect(result.isLeft(), true);

    expect(result, equals(const Left(HiveFailure("Error"))));
    verify(() => mockedRepo.getEntity(id: param.id)).called(1);
    verifyNoMoreInteractions(mockedRepo);
  });
}
