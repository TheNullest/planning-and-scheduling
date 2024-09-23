import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';
import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';
import 'package:zamaan/features/task/domain/usecases/time_interval_usecases/create_time_interval_usecase.dart';

import '_time_interval_repository.mock.dart';

void main() {
  late CreateTimeIntervalUsecase usecase;
  late TimeIntervalRepository mockedRepository;

  setUp(() {
    mockedRepository = MockTimeIntervalRepo();
    usecase = CreateTimeIntervalUsecase(mockedRepository);
  });

  TimeIntervalEntity param = TimeIntervalEntity.empty();
  test(
      '[timeInterval.createUsecase] must call the [TimeIntervalRepository.createEntity]',
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
