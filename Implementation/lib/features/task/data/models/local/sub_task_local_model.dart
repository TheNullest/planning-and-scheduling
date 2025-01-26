import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/sub_task_entity.dart';

part 'sub_task_local_model.g.dart'; // Include for code generation

@HiveType(typeId: 6) // Unique ID starts from 6
class SubTaskLocalModel extends SubTaskEntity {
  SubTaskLocalModel({
    required super.mainTaskId,
    required super.title,
    super.id,
    super.updatedAt,
    super.description,
    super.createdAt,
    super.userId,
    super.priority,
    super.status,
  }) : super();

  // For the purpose of testing
  SubTaskLocalModel.empty() : super.empty();

  factory SubTaskLocalModel.fromEntity(SubTaskEntity entity) =>
      SubTaskLocalModel(
        id: entity.id,
        updatedAt: entity.updatedAt,
        description: entity.description,
        createdAt: entity.createdAt,
        userId: entity.userId,
        mainTaskId: entity.mainTaskId,
        title: entity.title,
        priority: entity.priority,
        status: entity.status,
      );

  @override
  SubTaskLocalModel copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? description,
    String? mainTaskId,
    String? title,
    int? priority,
    int? status,
  }) =>
      SubTaskLocalModel(
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
        mainTaskId: mainTaskId ?? this.mainTaskId,
        title: title ?? this.title,
        priority: priority ?? this.priority,
        status: status ?? this.status,
      );
}
