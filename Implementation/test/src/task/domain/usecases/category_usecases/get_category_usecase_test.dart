import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/features/task/domain/entities/category_entity.dart';
import 'package:zamaan/features/task/domain/repositories/category_repository.dart';
import 'package:zamaan/features/task/domain/usecases/category_usecases/get_category_usecase.dart';

import '_category_repository.mock.dart';

void main() {
  late CategoryRepository mockedRepo;
  late GetCategoryUsecase usecase;
  late CategoryEntity param;

  setUp(() {
    mockedRepo = MockCategoryRepo();
    usecase = GetCategoryUsecase(mockedRepo);
    param = CategoryEntity.empty();
  });

  test(
      '[category.getUsecase] must call the [CategoryRepository.getEntity] and return [CategoryEntity]',
      () async {
    //Arrange
    when(() => mockedRepo.getEntity(id: param.id))
        .thenAnswer((_) async => Right(param));

    // Act
    final result = await usecase(param.id);
    expect(result, equals(Right<Failure, CategoryEntity>(param)));
    verify(() => mockedRepo.getEntity(id: param.id)).called(1);
    verifyNoMoreInteractions(mockedRepo);
  });
}
