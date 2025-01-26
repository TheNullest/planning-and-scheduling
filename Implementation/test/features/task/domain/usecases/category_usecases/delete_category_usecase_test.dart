import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/category_entity.dart';
import 'package:zamaan/features/task/domain/repositories/category_repository.dart';
import 'package:zamaan/features/task/domain/usecases/category_usecases/delete_category_usecase.dart';

import '_category_repository.mock.dart';

void main() {
  late DeleteCategoryUsecase useCase;
  late CategoryRepository repository;
  final params = CategoryEntity.empty().id;
  setUp(() {
    repository = MockCategoryRepo();
    useCase = DeleteCategoryUsecase(repository);
  });

  test(
      '[category.deleteUsecase] must call the [CategoryRepository.deleteEntity] and delete the entity then return the Right value',
      () async {
    // Arrange
    when(() => repository.deleteEntity(id: params))
        .thenAnswer((_) async => const Right(null));

    // Act
    final actual = await useCase(params);

    // Assert
    expect(actual.isRight(), true);
    expect(actual, equals(const Right<Failure, void>(null)));
    verify(
      () => repository.deleteEntity(id: params),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });

  test(
      '[category.deleteUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when deleteUsecase fails',
      () async {
    // Arrange
    when(() => repository.deleteEntity(id: params))
        .thenAnswer((_) async => const Left(HiveFailure('Error')));

    // Act
    final actual = await useCase(params);

    // Assert
    expect(actual.isLeft(), true);
    expect(actual, equals(const Left(HiveFailure('Error'))));
    verify(
      () => repository.deleteEntity(id: params),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
