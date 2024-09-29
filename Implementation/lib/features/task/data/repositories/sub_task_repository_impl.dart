import 'package:dartz/dartz.dart';
import 'package:zamaan/core/error/failures/failure.dart';
import 'package:zamaan/core/repositories/base_crud_operations.dart';
import 'package:zamaan/core/utils/enums/priority_enum.dart';
import 'package:zamaan/core/utils/enums/status_enum.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task/data/data_sources/hive/hive_sub_task_data_source_impl.dart';
import 'package:zamaan/features/task/data/models/local/hive_sub_task_model.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';
import 'package:zamaan/features/task/domain/repositories/sub_task_repository.dart';

class SubTaskRepositoryImpl extends BaseCRUDOperations<SubTaskEntity,
    HiveSubTaskModel, HiveSubTaskDataSourceImpl> implements SubTaskRepository {
  final HiveSubTaskDataSourceImpl _dataSource;

  SubTaskRepositoryImpl(super.dataSource) : _dataSource = dataSource;

  @override
  HiveSubTaskModel fromEntity(SubTaskEntity entity) =>
      HiveSubTaskModel.fromEntity(entity);

  @override
  SubTaskEntity toEntity(HiveSubTaskModel model) => model.toEntity();

  Either<Failure, List<SubTaskEntity>> toEntities(
          Either<Failure, List<HiveSubTaskModel>> models) =>
      models.map((taskModels) => taskModels
          .map<SubTaskEntity>((taskModel) => taskModel.toEntity())
          .toList());

  @override
  ResultFuture<List<SubTaskEntity>> getSubTasksByMainTaskId(
          String mainTaskId) async =>
      toEntities(await _dataSource.getSubTasksByMainTaskId(mainTaskId));

  @override
  ResultFuture<List<SubTaskEntity>> getSubTasksByPriority(
          Priority priority) async =>
      toEntities(await _dataSource.getSubTasksByPriority(priority));

  @override
  ResultFuture<List<SubTaskEntity>> getSubTasksByStatus(Status status) async =>
      toEntities(await _dataSource.getSubTasksByStatus(status));
}
