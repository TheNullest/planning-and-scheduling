import 'package:hive/hive.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/enums/enums.dart';

class SubTaskEntity extends BaseEntityAbstraction {
  SubTaskEntity({
    required this.mainTaskId,
    required this.title,
    super.id,
    super.updatedAt,
    super.createdAt,
    super.userId,
    super.description,
    int? priority,
    int? status,
  })  : priority = priority ?? Priority.optional.index,
        status = status ?? Status.notStarted.index;

  SubTaskEntity.empty() : this(mainTaskId: '1', title: 'title');
  @HiveField(4)
  final String mainTaskId;

  @HiveField(5)
  final int priority;

  @HiveField(6)
  final String title;

  /// Status == 0 => notStarted\
  /// Status == 1 => inProgress\
  /// Status == 2 => completed
  @HiveField(7)
  final int status;
  SubTaskEntity toEntity() => SubTaskEntity(
        id: id,
        updatedAt: updatedAt,
        description: description,
        createdAt: createdAt,
        userId: userId,
        mainTaskId: mainTaskId,
        title: title,
        priority: priority,
        status: status,
      );

  @override
  SubTaskEntity copyWith({
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
      SubTaskEntity(
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

  @override
  List<Object?> get props => [
        id,
        updatedAt,
        createdAt,
        userId,
        description,
        mainTaskId,
        title,
        priority,
        status,
      ];
}
