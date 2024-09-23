import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/features/task/domain/entities/tag_entity.dart';
import 'package:zamaan/features/task/domain/repositories/tag_repository.dart';
import 'package:zamaan/features/task/domain/usecases/tag_usecases/get_tag_usecase.dart';

import '_tag_repository.mock.dart';

void main() {
  late TagRepository mockedRepo;
  late GetTagUsecase usecase;
  late TagEntity param;

  setUp(() {
    mockedRepo = MockTagRepo();
    usecase = GetTagUsecase(mockedRepo);
    param = TagEntity.empty();
  });

  test(
      '[tag.getUsecase] must call the [TagRepository.getEntity] and return [TagEntity]',
      () async {
    //Arrange
    when(() => mockedRepo.getEntity(id: param.id))
        .thenAnswer((_) async => Right(param));

    // Act
    final result = await usecase(param.id);
    expect(result, equals(Right<Failure, TagEntity>(param)));
    verify(() => mockedRepo.getEntity(id: param.id)).called(1);
    verifyNoMoreInteractions(mockedRepo);
  });
}
