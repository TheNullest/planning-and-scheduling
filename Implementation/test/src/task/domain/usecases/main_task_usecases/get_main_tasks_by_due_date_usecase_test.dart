import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';
import 'package:zamaan/features/task/domain/usecases/main_task_usecases/get_main_tasks_by_due_date_usecase.dart';

import '_main_task_repository.mock.dart';

void main() {
  late GetMainTasksByDueDateUsecase useCase;
  late MainTaskRepository repository;
  setUp(() {
    repository = MockMainTaskRepo();
    useCase = GetMainTasksByDueDateUsecase(repository);
  });

  DateTime param = DateTime.now();
  test(
      '[mainTask.GetMainTasksByDueDateUsecase] must call the [MainTaskRepository.getMainTasksByDueDate] and return [List<MainTaskEntity>]',
      () async {
    //Arrange
    when(() => repository.getMainTasksByDueDate(param))
        .thenAnswer((_) async => const Right([]));

    // Act
    final result = await useCase(param);

    // Assert
    expect(result, equals(const Right<dynamic, List<MainTaskEntity>>([])));
    verify(() => repository.getMainTasksByDueDate(param)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
