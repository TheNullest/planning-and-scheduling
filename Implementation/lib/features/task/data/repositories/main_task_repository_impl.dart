import 'package:dartz/dartz.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/repositories/base_crud_operations.dart';
import 'package:zamaan/core/utils/enums/enums.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_main_task_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_main_task_model.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/main_task_repository.dart';

class MainTaskRepositoryImpl extends BaseCRUDOperations<
    MainTaskEntity,
    HiveMainTaskModel,
    HiveMainTaskDataSourceImpl> implements MainTaskRepository {
  final HiveMainTaskDataSourceImpl _dataSource;

  MainTaskRepositoryImpl(super.dataSource) : _dataSource = dataSource;

  @override
  HiveMainTaskModel fromEntity(MainTaskEntity entity) =>
      HiveMainTaskModel.fromEntity(entity);

  @override
  MainTaskEntity toEntity(HiveMainTaskModel model) => model.toEntity();

  Either<Failure, List<MainTaskEntity>> toEntities(
          Either<Failure, List<HiveMainTaskModel>> models) =>
      models.map((taskModels) => taskModels
          .map<MainTaskEntity>((taskModel) => taskModel.toEntity())
          .toList());

  @override
  ResultFuture<List<MainTaskEntity>> getMainTasksByCategories(
          List<String> categoryIds) async =>
      toEntities(await _dataSource.getMainTasksByCategories(categoryIds));

  @override
  ResultFuture<List<MainTaskEntity>> getMainTasksByDueDate(
          DateTime dueDate) async =>
      toEntities(await _dataSource.getMainTasksByDueDate(dueDate));

  @override
  ResultFuture<List<MainTaskEntity>> getMainTasksByPriority(
          Priority priority) async =>
      toEntities(await _dataSource.getMainTasksByPriority(priority));

  @override
  ResultFuture<List<MainTaskEntity>> getMainTasksByStatus(
          Status status) async =>
      toEntities(await _dataSource.getMainTasksByStatus(status));

  @override
  ResultFuture<List<MainTaskEntity>> getMainTasksByTags(
          List<String> tagIds) async =>
      toEntities(await _dataSource.getMainTasksByTags(tagIds));

  @override
  ResultFuture<MainTaskEntity> getMainTaskByTaskSchedulerId(
      String schedulerId) async {
    var result = await _dataSource.getMainTaskByTaskSchedulerId(schedulerId);
    return result.map((model) => toEntity(model));
  }
}
