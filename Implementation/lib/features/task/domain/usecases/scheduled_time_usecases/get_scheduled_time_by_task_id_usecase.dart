import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/scheduled_time_entity.dart';
import 'package:zamaan/features/task/domain/repositories/scheduled_time_repository.dart';

class GetScheduledTimeByTaskIdUsecase extends UseCaseWithParams<
    ScheduledTimeEntity,
    ScheduledTimeRepository,
    List<ScheduledTimeEntity>,
    String> {
  GetScheduledTimeByTaskIdUsecase(super.repository);

  @override
  ResultFuture<List<ScheduledTimeEntity>> call(String params) async =>
      await repository.getScheduledTimeByTaskId(params);
}
