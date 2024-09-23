import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/features/task/domain/repositories/sub_task_repository.dart';
import 'package:zamaan/features/task/domain/usecases/sub_task_usecases/delete_all_selected_sub_tasks_usecase.dart';

import '_sub_task_repository.mock.dart';

void main() {
  late DeleteAllSelectedSubTasksUsecase useCase;
  late SubTaskRepository repository;
  setUp(() {
    repository = MockSubTaskRepo();
    useCase = DeleteAllSelectedSubTasksUsecase(repository);
  });

  test(
      '[subTask.deleteAllSelectedUsecase] must call the [SubTaskRepository.deleteAllSelected] and delete the entity then return the Right value',
      () async {
    // Arrange
    when(() => repository.deleteAllSelected([]))
        .thenAnswer((_) async => const Right(null));

    // Act
    final actual = await useCase([]);

    // Assert
    expect(actual, equals(const Right<Failure, void>(null)));
    verify(
      () => repository.deleteAllSelected([]),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
