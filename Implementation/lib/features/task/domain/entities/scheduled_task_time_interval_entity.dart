import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';

class ScheduledTaskTimeIntervalEntity extends BaseEntityAbstraction {
  @HiveField(4)
  final String mainTaskId;

  @HiveField(5)
  final DateTime willStartAt;

  /// **Conditional End Time:**
  ///
  /// - If the task has a **predefined end time**, then `endAt` should be set
  ///   at the same time as the entire `ScheduledTaskTimeIntervalEntity` definition.
  ///   This signifies a fixed duration for the task.
  /// - If the task has no predefined end time, `endAt` will be set later
  ///   when the task is actually completed. This indicates a dynamic duration.
  @HiveField(6)
  final DateTime? endAt;

  ScheduledTaskTimeIntervalEntity(
      {super.id,
      super.order,
      super.createdAt,
      super.creatorId,
      super.description,
      required this.mainTaskId,
      required this.willStartAt,
      required this.endAt});

  ScheduledTaskTimeIntervalEntity copyWith(
    String? id,
    int? order,
    DateTime? createdAt,
    String? creatorId,
    String? description,
    String? mainTaskId,
    DateTime? willStartAt,
    DateTime? endAt,
  ) =>
      ScheduledTaskTimeIntervalEntity(
        id: id ?? this.id,
        order: order ?? this.order,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        creatorId: creatorId ?? this.creatorId,
        mainTaskId: mainTaskId ?? this.mainTaskId,
        willStartAt: willStartAt ?? this.willStartAt,
        endAt: endAt ?? this.endAt,
      );

  @override
  List<Object?> get props => [
        id,
        order,
        createdAt,
        creatorId,
        description,
        mainTaskId,
        willStartAt,
        endAt,
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
