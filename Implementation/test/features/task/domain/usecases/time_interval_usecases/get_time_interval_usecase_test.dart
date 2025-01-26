import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/error/failures/hive_failure.dart';
import 'package:zamaan/features/task/domain/entities/time_interval_entity.dart';
import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';
import 'package:zamaan/features/task/domain/usecases/time_interval_usecases/get_time_interval_usecase.dart';

import '_time_interval_repository.mock.dart';

void main() {
  late TimeIntervalRepository mockedRepo;
  late GetTimeIntervalUsecase usecase;
  late TimeIntervalEntity param;

  setUp(() {
    mockedRepo = MockTimeIntervalRepo();
    usecase = GetTimeIntervalUsecase(mockedRepo);
    param = TimeIntervalEntity.empty();
  });

  test(
      '[timeInterval.getUsecase] must call the [TimeIntervalRepository.getEntity] and return [TimeIntervalEntity]',
      () async {
    //Arrange
    when(() => mockedRepo.getEntity(id: param.id))
        .thenAnswer((_) async => Right(param));

    // Act
    final result = await usecase(param.id);

    expect(result.isRight(), true);

    expect(result, equals(Right<Failure, TimeIntervalEntity>(param)));
    verify(() => mockedRepo.getEntity(id: param.id)).called(1);
    verifyNoMoreInteractions(mockedRepo);
  });

  test(
      '[timeInterval.getUsecase.failureTest] must return failure with [Left(HiveFailure("Error"))] data when getUsecase fails',
      () async {
    //Arrange
    when(() => mockedRepo.getEntity(id: param.id))
        .thenAnswer((_) async => const Left(HiveFailure('Error')));

    // Act
    final result = await usecase(param.id);

    expect(result.isLeft(), true);
    expect(result, equals(const Left(HiveFailure('Error'))));
    verify(() => mockedRepo.getEntity(id: param.id)).called(1);
    verifyNoMoreInteractions(mockedRepo);
  });
}
