import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/utils/enums/enums.dart';

class SubTaskEntity extends BaseEntityAbstraction {
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

  SubTaskEntity({
    super.id,
    super.order,
    super.createdAt,
    super.creatorId,
    super.description,
    required this.mainTaskId,
    required this.title,
    int? priority,
    int? status,
  })  : priority = priority ?? Priority.optional.index,
        status = status ?? Status.notStarted.index;

  SubTaskEntity.empty() : this(mainTaskId: '1', title: 'title');

  SubTaskEntity copyWith(
    String? id,
    int? order,
    DateTime? createdAt,
    String? creatorId,
    String? description,
    String? mainTaskId,
    String? title,
    int? priority,
    int? status,
  ) =>
      SubTaskEntity(
        id: id ?? this.id,
        order: order ?? this.order,
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
        order,
        createdAt,
        creatorId,
        description,
        mainTaskId,
        title,
        priority,
        status
      ];
}
