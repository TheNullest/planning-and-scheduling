import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/sub_task_repository.dart';
import 'package:zamaan/features/task/domain/usecases/sub_task_usecases/get_sub_tasks_by_main_task_id_usecase.dart';

import '_sub_task_repository.mock.dart';

void main() {
  late GetSubTasksByMainTaskIdUsecase useCase;
  late SubTaskRepository repository;
  setUp(() {
    repository = MockSubTaskRepo();
    useCase = GetSubTasksByMainTaskIdUsecase(repository);
  });

  test(
      '[subTask.GetSubTasksByMainTaskIdUsecase] must call the [SubTaskRepository.getSubTasksByMainTaskId] and return [List<SubTaskEntity>]',
      () async {
    //Arrange
    when(() => repository.getSubTasksByMainTaskId('1'))
        .thenAnswer((_) async => const Right([]));

    // Act
    final result = await useCase('1');

    // Assert
    expect(result.isRight(), true);

    expect(result, equals(const Right<dynamic, List<SubTaskEntity>>([])));
    verify(() => repository.getSubTasksByMainTaskId('1')).called(1);
    verifyNoMoreInteractions(repository);
  });

  test(
      '[subTask.GetSubTasksByMainTaskIdUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when GetSubTasksByMainTaskIdUsecase fails',
      () async {
    //Arrange
    when(() => repository.getSubTasksByMainTaskId('1'))
        .thenAnswer((_) async => const Left(HiveFailure("Error")));

    // Act
    final result = await useCase('1');

    // Assert
    expect(result.isLeft(), true);
    expect(result, equals(const Left(HiveFailure("Error"))));
    verify(() => repository.getSubTasksByMainTaskId('1')).called(1);
    verifyNoMoreInteractions(repository);
  });
}
