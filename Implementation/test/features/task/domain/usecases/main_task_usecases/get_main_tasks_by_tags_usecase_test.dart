import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';
import 'package:zamaan/features/task/domain/usecases/main_task_usecases/get_main_tasks_by_tags_usecase.dart';

import '_main_task_repository.mock.dart';

void main() {
  late GetMainTasksByTagsUsecase useCase;
  late MainTaskRepository repository;
  setUp(() {
    repository = MockMainTaskRepo();
    useCase = GetMainTasksByTagsUsecase(repository);
  });

  test(
      '[mainTask.GetMainTasksByTagsUsecase] must call the [MainTaskRepository.getMainTasksByTags] and return [List<MainTaskEntity>]',
      () async {
    //Arrange
    when(() => repository.getMainTasksByTags([]))
        .thenAnswer((_) async => const Right([]));

    // Act
    final result = await useCase([]);

    // Assert
    expect(result.isRight(), true);

    expect(result, equals(const Right<dynamic, List<MainTaskEntity>>([])));
    verify(() => repository.getMainTasksByTags([])).called(1);
    verifyNoMoreInteractions(repository);
  });

  test(
      '[mainTask.GetMainTasksByTagsUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when GetMainTasksByTagsUsecase fails',
      () async {
    //Arrange
    when(() => repository.getMainTasksByTags([]))
        .thenAnswer((_) async => const Left(HiveFailure('Error')));

    // Act
    final result = await useCase([]);

    // Assert
    expect(result.isLeft(), true);
    expect(result, equals(const Left(HiveFailure('Error'))));
    verify(() => repository.getMainTasksByTags([])).called(1);
    verifyNoMoreInteractions(repository);
  });
}
