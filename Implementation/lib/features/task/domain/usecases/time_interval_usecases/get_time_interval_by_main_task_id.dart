import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/task_time_interval_entity.dart';
import 'package:zamaan/features/task/domain/repositories/time_interval_repository.dart';

class GetTimeIntervalByMainTaskId extends UseCaseWithParams<
    TimeIntervalRepository, List<TimeIntervalEntity>, String> {
  GetTimeIntervalByMainTaskId(super.repository);

  @override
  ResultFuture<List<TimeIntervalEntity>> call(String params) async =>
      await repository.getTimeIntervalByMainTaskId(params);
}
