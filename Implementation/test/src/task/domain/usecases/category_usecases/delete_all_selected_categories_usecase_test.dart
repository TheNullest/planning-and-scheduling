import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/features/task/domain/repositories/category_repository.dart';
import 'package:zamaan/features/task/domain/usecases/category_usecases/delete_all_selected_categories_usecase.dart';

import '_category_repository.mock.dart';

void main() {
  late DeleteAllSelectedCategoriesUsecase useCase;
  late CategoryRepository repository;
  setUp(() {
    repository = MockCategoryRepo();
    useCase = DeleteAllSelectedCategoriesUsecase(repository);
  });

  test(
      '[category.deleteAllSelectedUsecase] must call the [CategoryRepository.deleteAllSelected] and delete the entity then return the Right value',
      () async {
    // Arrange
    when(() => repository.deleteAllSelected([]))
        .thenAnswer((_) async => const Right(null));

    // Act
    final actual = await useCase([]);

    // Assert
    expect(actual, equals(const Right<Failure, void>(null)));
    verify(
      () => repository.deleteAllSelected([]),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
