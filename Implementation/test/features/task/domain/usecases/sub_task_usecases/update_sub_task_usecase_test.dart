import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/sub_task_repository.dart';
import 'package:zamaan/features/task/domain/usecases/sub_task_usecases/update_sub_task_usecase.dart';

import '_sub_task_repository.mock.dart';

void main() {
  // Arrange
  late UpdateSubTaskUsecase useCase;
  late SubTaskRepository repository;
  setUp(() {
    repository = MockSubTaskRepo();
    useCase = UpdateSubTaskUsecase(repository);
  });

  final params = SubTaskEntity.empty();
  // Assert
  test(
      '[subTask.updateUsecase] must call the [SubTaskRepository.updateEntity] and update the [SubTaskModel] with the right data',
      () async {
    //Arrange
    when(() => repository.updateEntity(entity: params))
        .thenAnswer((_) async => const Right(null));
    // Act
    final actual = await useCase(params);

    // Assert
    expect(actual, equals(const Right<Failure, void>(null)));
    verify(() => repository.updateEntity(entity: params)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test(
      '[subTask.updateUsecase.failureTest] must return failure when update fails',
      () async {
    // Arrange
    const failure = HiveFailure('Update failed');
    when(() => repository.updateEntity(entity: params))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await repository.updateEntity(entity: params);

    // Assert
    expect(result, isA<Left>());
    expect(result, equals(const Left<Failure, void>(failure)));

    verify(() => repository.updateEntity(entity: params)).called(1);
  });
}
