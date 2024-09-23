import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';
import 'package:zamaan/features/task/domain/usecases/main_task_usecases/create_main_task_usecase.dart';

import '_main_task_repository.mock.dart';

void main() {
  late CreateMainTaskUseCase usecase;
  late MainTaskRepository mockedRepository;

  setUp(() {
    mockedRepository = MockMainTaskRepo();
    usecase = CreateMainTaskUseCase(mockedRepository);
  });

  MainTaskEntity param = MainTaskEntity.empty();
  test(
      '[mainTask.createUsecase] must call the [MainTaskRepository.createEntity]',
      () async {
    // Arrange
    // Act
    when(() => mockedRepository.createEntity(newEntity: param))
        .thenAnswer((_) async => const Right(null));
    var actualResult = await usecase(param);

    // Assert
    expect(actualResult, equals(const Right<Failure, void>(null)));
    verify(() => mockedRepository.createEntity(newEntity: param)).called(1);
    verifyNoMoreInteractions(mockedRepository);
  });
}
