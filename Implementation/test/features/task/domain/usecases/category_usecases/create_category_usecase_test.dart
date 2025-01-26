import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/category_entity.dart';
import 'package:zamaan/features/task/domain/repositories/category_repository.dart';
import 'package:zamaan/features/task/domain/usecases/category_usecases/create_category_usecase.dart';

import '_category_repository.mock.dart';

void main() {
  late CreateCategoryUsecase usecase;
  late CategoryRepository mockedRepository;

  setUp(() {
    mockedRepository = MockCategoryRepo();
    usecase = CreateCategoryUsecase(mockedRepository);
  });

  final param = CategoryEntity.empty();
  test('[category.createUsecase] must call the [CategoryRepo.createEntity]',
      () async {
    // Arrange
    // Act
    when(() => mockedRepository.createEntity(newEntity: param))
        .thenAnswer((_) async => const Right(null));
    final actualResult = await usecase(param);

    // Assert
    expect(actualResult.isRight(), true);
    expect(actualResult, equals(const Right<Failure, void>(null)));
    verify(() => mockedRepository.createEntity(newEntity: param)).called(1);
    verifyNoMoreInteractions(mockedRepository);
  });

  test(
      '[category.createUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when createUsecase fails',
      () async {
    // Arrange
    // Act
    when(() => mockedRepository.createEntity(newEntity: param))
        .thenAnswer((_) async => const Left(HiveFailure('Error')));
    final actualResult = await usecase(param);

    // Assert
    expect(actualResult.isLeft(), true);
    expect(actualResult, equals(const Left(HiveFailure('Error'))));
    verify(() => mockedRepository.createEntity(newEntity: param)).called(1);
    verifyNoMoreInteractions(mockedRepository);
  });
}
