import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';
import 'package:zamaan/features/task/domain/usecases/main_task_usecases/get_main_tasks_by_week_days_usecase.dart';

import '_main_task_repository.mock.dart';

void main() {
  late GetMainTasksByWeekDaysUsecase useCase;
  late MainTaskRepository repository;
  setUp(() {
    repository = MockMainTaskRepo();
    useCase = GetMainTasksByWeekDaysUsecase(repository);
  });

  test(
      '[mainTask.GetMainTasksByWeekDaysUsecase] must call the [MainTaskRepository.getMainTasksByWeekDays] and return [List<MainTaskEntity>]',
      () async {
    //Arrange
    when(() => repository.getMainTasksByWeekDays([1, 2]))
        .thenAnswer((_) async => const Right([]));

    // Act
    final result = await useCase([1, 2]);

    // Assert
    expect(result, equals(const Right<dynamic, List<MainTaskEntity>>([])));
    verify(() => repository.getMainTasksByWeekDays([1, 2])).called(1);
    verifyNoMoreInteractions(repository);
  });
}
