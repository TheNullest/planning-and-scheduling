import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/features/task/domain/entities/category_entity.dart';
import 'package:zamaan/features/task/domain/repositories/category_repository.dart';
import 'package:zamaan/features/task/domain/usecases/category_usecases/get_categories_usecase.dart';

import '_category_repository.mock.dart';

void main() {
  late GetCategoriesUsecase useCase;
  late CategoryRepository repository;
  setUp(() {
    repository = MockCategoryRepo();
    useCase = GetCategoriesUsecase(repository);
  });

  test(
      '[category.getAllUsecase] must call the [CategoryRepository.getEntities] and return [List<CategoryEntity>]',
      () async {
    //Arrange
    when(() => repository.getEntities())
        .thenAnswer((_) async => const Right([]));

    // Act
    final result = await useCase();

    // Assert
    expect(result, equals(const Right<dynamic, List<CategoryEntity>>([])));
    verify(() => repository.getEntities()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
