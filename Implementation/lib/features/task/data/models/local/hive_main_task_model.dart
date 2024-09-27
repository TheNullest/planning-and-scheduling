import 'package:hive/hive.dart';
import 'package:zamaan/core/hive_type_adapter/hive_base_type_adapter.dart';
import 'package:zamaan/features/task/domain/entities/main_task_entity.dart';

part 'hive_main_task_model.g.dart';

@HiveType(typeId: 1)
class HiveMainTaskModel extends MainTaskEntity {
  HiveMainTaskModel({
    super.id,
    super.order,
    super.creatorId,
    super.description,
    required super.title,
    required super.categoryIds,
    super.createdAt,
    required super.colorCode,
    required super.iconCode,
    super.priority,
    super.status,
    super.fixedTagIds,
    super.tagIds,
    super.dueDate,
    super.totalSpentTime,
    super.taskSchedulerId,
  });

  HiveMainTaskModel.empty() : super.empty();

  factory HiveMainTaskModel.fromEntity(MainTaskEntity entity) =>
      HiveMainTaskModel(
        id: entity.id,
        order: entity.order,
        description: entity.description,
        createdAt: entity.createdAt,
        creatorId: entity.creatorId,
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

  MainTaskEntity toEntity() => MainTaskEntity(
        id: id,
        order: order,
        description: description,
        createdAt: createdAt,
        creatorId: creatorId,
        title: title,
        colorCode: colorCode,
        iconCode: iconCode,
        categoryIds: categoryIds,
        priority: priority,
        status: status,
        fixedTagIds: fixedTagIds,
        tagIds: tagIds,
        dueDate: dueDate,
        totalSpentTime: totalSpentTime,
        taskSchedulerId: taskSchedulerId,
      );

  @override
  HiveMainTaskModel copyWith(
    String? id,
    int? order,
    DateTime? createdAt,
    String? creatorId,
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
  ) =>
      HiveMainTaskModel(
        id: id ?? this.id,
        order: order ?? this.order,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        creatorId: creatorId ?? this.creatorId,
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
