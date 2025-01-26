import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';

part 'main_task_local_model.g.dart';

@HiveType(typeId: 1)
class MainTaskLocalModel extends MainTaskEntity {
  MainTaskLocalModel({
    required super.title,
    required super.categoryIds,
    required super.colorCode,
    required super.iconCode,
    super.id,
    super.updatedAt,
    super.userId,
    super.description,
    super.createdAt,
    super.priority,
    super.status,
    super.fixedTagIds,
    super.tagIds,
    super.dueDate,
    super.totalSpentTime,
    super.taskSchedulerId,
  });

  MainTaskLocalModel.empty() : super.empty();

  factory MainTaskLocalModel.fromEntity(MainTaskEntity entity) =>
      MainTaskLocalModel(
        id: entity.id,
        updatedAt: entity.updatedAt,
        description: entity.description,
        createdAt: entity.createdAt,
        userId: entity.userId,
        title: entity.title,
        colorCode: entity.colorCode,
        iconCode: entity.iconCode,
        categoryIds: entity.categoryIds,
        priority: entity.priority,
        status: entity.status,
        fixedTagIds: entity.fixedTagIds,
        tagIds: entity.tagIds,
        dueDate: entity.dueDate,
        totalSpentTime: entity.totalSpentTime,
        taskSchedulerId: entity.taskSchedulerId,
      );

  @override
  MainTaskLocalModel copyWith({
    String? id,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? userId,
    String? description,
    String? title,
    int? colorCode,
    int? iconCode,
    List<String>? categoryIds,
    int? priority,
    int? status,
    List<String>? fixedTagIds,
    List<String>? tagIds,
    DateTime? dueDate,
    Duration? totalSpentTime,
    String? taskSchedulerEntityId,
  }) =>
      MainTaskLocalModel(
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        colorCode: colorCode ?? this.colorCode,
        iconCode: iconCode ?? this.iconCode,
        categoryIds: categoryIds ?? this.categoryIds,
        priority: priority ?? this.priority,
        status: status ?? this.status,
        fixedTagIds: fixedTagIds ?? this.fixedTagIds,
        tagIds: tagIds ?? this.tagIds,
        dueDate: dueDate ?? this.dueDate,
        totalSpentTime: totalSpentTime ?? this.totalSpentTime,
        taskSchedulerId: taskSchedulerId ?? taskSchedulerId,
      );
}
