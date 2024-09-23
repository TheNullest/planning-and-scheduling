import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/tag_entity.dart';
import 'package:zamaan/features/task/domain/repositories/tag_repository.dart';
import 'package:zamaan/features/task/domain/usecases/tag_usecases/update_tag_usecase.dart';

import '_tag_repository.mock.dart';

void main() {
  // Arrange
  late UpdateTagUsecase useCase;
  late TagRepository repository;
  setUp(() {
    repository = MockTagRepo();
    useCase = UpdateTagUsecase(repository);
  });

  TagEntity params = TagEntity.empty();
  // Assert
  test(
      '[tag.updateUsecase] must call the [TagRepository.updateEntity] update the [TagModel] with the right data',
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

  test('[tag.updateUsecase.failureTest] must return failure when update fails',
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
