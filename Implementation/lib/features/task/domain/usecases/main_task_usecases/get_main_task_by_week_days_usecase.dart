import 'package:zamaan/core/usecases/base_usecase.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class GetMainTaskByWeekDaysUsecase extends UseCaseWithParams<MainTaskRepository,
    List<MainTaskEntity>, List<int>> {
  GetMainTaskByWeekDaysUsecase(super.repository);

  /// [params] = List of integers wich represent the days of the week
  ///
  /// **Saturday** is the first day of the week
  @override
  ResultFuture<List<MainTaskEntity>> call(List<int> params) async =>
      await repository.getMainTasksByWeekDays(params);
}
