import 'package:hive/hive.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';

/// Represents a time interval entity with details about tasks and time spent.
///
/// This class extends `BaseEntityAbstraction` and includes additional fields
/// for task IDs, start and end times, and calculated spent time.
class TimeIntervalEntity extends BaseEntityAbstraction {
  /// Creates a new `TimeIntervalEntity` with the specified properties.
  ///
  /// The `mainTaskId`, `subTaskId`, and `startAt` are required to initialize the entity.
  /// The `id`, `order`, `createdAt`, `userId`, `description`, and `endAt` are optional
  /// and can be customized. The `spentTime` is automatically calculated and cannot be
  /// directly customized or manipulated.
  TimeIntervalEntity({
    required this.mainTaskId,
    required this.subTaskId,
    required this.startAt,
    super.id,
    super.updatedAt,
    super.createdAt,
    super.userId,
    super.description,
    this.endAt,
    Duration? spentTime,
  }) : spentTime = (endAt != null && spentTime == null)
            ? (endAt.isAfter(startAt)
                ? endAt.difference(startAt)
                : throw ArgumentError('endAt must be after startAt'))
            : spentTime;

  /// Creates an empty `TimeIntervalEntity` with default values.
  ///
  /// This constructor is useful for initializing an entity with default values.
  TimeIntervalEntity.empty()
      : this(mainTaskId: '1', subTaskId: '2', startAt: DateTime(2024));

  /// The ID of the main task associated with this time interval.
  @HiveField(4)
  final String mainTaskId;

  /// The ID of the sub-task associated with this time interval.
  @HiveField(5)
  final String subTaskId;

  /// The start time of the time interval.
  @HiveField(6)
  final DateTime startAt;

  /// The end time of the time interval, if any.
  @HiveField(7)
  final DateTime? endAt;

  /// The calculated spent time based on the difference between `startAt` and `endAt`.
  ///
  /// If `endAt` is provided and is after `startAt`, the `spentTime` field will be
  /// automatically calculated as the difference between `startAt` and `endAt`.
  /// If `endAt` is not set, `spentTime` remains null.
  @HiveField(8)
  final Duration? spentTime;

  @override
  TimeIntervalEntity copyWith({
    String? id,
    int? order,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? description,
    String? mainTaskId,
    String? subTaskId,
    DateTime? startAt,
    DateTime? endAt,
  }) =>
      TimeIntervalEntity(
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
        mainTaskId: mainTaskId ?? this.mainTaskId,
        subTaskId: subTaskId ?? this.subTaskId,
        startAt: startAt ?? this.startAt,
        endAt: endAt ?? this.endAt,
      );

  TimeIntervalEntity toEntity() => TimeIntervalEntity(
        id: id,
        updatedAt: updatedAt,
        description: description,
        createdAt: createdAt,
        userId: userId,
        mainTaskId: mainTaskId,
        subTaskId: subTaskId,
        startAt: startAt,
        endAt: endAt,
        spentTime: spentTime,
      );

  /// Returns a list of properties that are used to determine equality.
  ///
  /// This method is used by the `equatable` package to compare instances of
  /// `TimeIntervalEntity`.
  @override
  List<Object?> get props => [
        id,
        updatedAt,
        createdAt,
        userId,
        description,
        mainTaskId,
        subTaskId,
        startAt,
        endAt,
        spentTime,
      ];
}
