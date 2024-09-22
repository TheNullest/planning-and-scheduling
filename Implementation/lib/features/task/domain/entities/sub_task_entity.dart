import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/utils/enums.dart';

class SubTaskEntity extends BaseEntityAbstraction {
  @HiveField(4)
  final String mainTaskId;

  @HiveField(5)
  final Priority priority;

  @HiveField(6)
  final String title;

  /// Status == 0 => notStarted\
  /// Status == 1 => inProgress\
  /// Status == 2 => completed
  @HiveField(7)
  final Status status;

  SubTaskEntity({
    super.id,
    super.createdAt,
    super.creatorId,
    super.description,
    required this.mainTaskId,
    required this.title,
    this.priority = Priority.optional,
    this.status = Status.notStarted,
  });

  SubTaskEntity copyWith(
    String? id,
    DateTime? createdAt,
    String? creatorId,
    String? description,
    String? mainTaskId,
    String? title,
    Priority? priority,
    Status? status,
  ) =>
      SubTaskEntity(
        id: id ?? this.id,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        creatorId: creatorId ?? this.creatorId,
        mainTaskId: mainTaskId ?? this.mainTaskId,
        title: title ?? this.title,
        priority: priority ?? this.priority,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [
        id,
        createdAt,
        creatorId,
        description,
        mainTaskId,
        title,
        priority,
        status
      ];

  @override
  BaseEntityAbstraction fromEntity(BaseEntityAbstraction entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  BaseEntityAbstraction toEntity() {
    // TODO: implement toEntity
    throw UnimplementedError();
  }
}
