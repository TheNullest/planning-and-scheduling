import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/sub_task_repository.dart';
import 'package:zamaan/features/task/domain/usecases/sub_task_usecases/get_sub_tasks_usecase.dart';

import '_sub_task_repository.mock.dart';

void main() {
  late GetSubTasksUsecase useCase;
  late SubTaskRepository repository;
  setUp(() {
    repository = MockSubTaskRepo();
    useCase = GetSubTasksUsecase(repository);
  });

  test(
      '[goal.getAllUsecase] must call the [SubTaskRepository.getEntities] and return [List<SubTaskEntity>]',
      () async {
    //Arrange
    when(() => repository.getEntities())
        .thenAnswer((_) async => const Right([]));

    // Act
    final result = await useCase();

    // Assert
    expect(result, equals(const Right<dynamic, List<SubTaskEntity>>([])));
    verify(() => repository.getEntities()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
