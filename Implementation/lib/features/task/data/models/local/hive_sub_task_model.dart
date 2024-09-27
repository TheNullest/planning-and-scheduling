import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';

part 'hive_sub_task_model.g.dart'; // Include for code generation

@HiveType(typeId: 6) // Unique ID starts from 6
class HiveSubTaskModel extends SubTaskEntity {
  HiveSubTaskModel({
    super.id,
    super.order,
    super.description,
    super.createdAt,
    super.creatorId,
    required super.mainTaskId,
    required super.title,
    super.priority,
    super.status,
  }) : super();

  // For the purpose of testing
  HiveSubTaskModel.empty() : super.empty();

  factory HiveSubTaskModel.fromEntity(SubTaskEntity entity) => HiveSubTaskModel(
        id: entity.id,
        order: entity.order,
        description: entity.description,
        createdAt: entity.createdAt,
        creatorId: entity.creatorId,
        mainTaskId: entity.mainTaskId,
        title: entity.title,
        priority: entity.priority,
        status: entity.status,
      );

  SubTaskEntity toEntity() => SubTaskEntity(
        id: id,
        order: order,
        description: description,
        createdAt: createdAt,
        creatorId: creatorId,
        mainTaskId: mainTaskId,
        title: title,
        priority: priority,
        status: status,
      );
}
