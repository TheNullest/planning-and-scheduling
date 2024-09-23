import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/sub_task_repository.dart';
import 'package:zamaan/features/task/domain/usecases/sub_task_usecases/get_sub_task_usecase.dart';

import '_sub_task_repository.mock.dart';

void main() {
  late SubTaskRepository mockedRepo;
  late GetSubTaskUsecase usecase;
  late SubTaskEntity param;

  setUp(() {
    mockedRepo = MockSubTaskRepo();
    usecase = GetSubTaskUsecase(mockedRepo);
    param = SubTaskEntity.empty();
  });

  test(
      '[subTask.getUsecase] must call the [SubTaskRepository.getEntity] and return [SubTaskEntity]',
      () async {
    //Arrange
    when(() => mockedRepo.getEntity(id: param.id))
        .thenAnswer((_) async => Right(param));

    // Act
    final result = await usecase(param.id);
    expect(result, equals(Right<Failure, SubTaskEntity>(param)));
    verify(() => mockedRepo.getEntity(id: param.id)).called(1);
    verifyNoMoreInteractions(mockedRepo);
  });
}
