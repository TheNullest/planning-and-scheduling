import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';

/// Represents a time interval entity with details about tasks and time spent.
///
/// This class extends `BaseEntityAbstraction` and includes additional fields
/// for task IDs, start and end times, and calculated spent time.
class TimeIntervalEntity extends BaseEntityAbstraction {
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

  /// Creates a new `TimeIntervalEntity` with the specified properties.
  ///
  /// The `mainTaskId`, `subTaskId`, and `startAt` are required to initialize the entity.
  /// The `id`, `order`, `createdAt`, `creatorId`, `description`, and `endAt` are optional
  /// and can be customized. The `spentTime` is automatically calculated and cannot be
  /// directly customized or manipulated.
  TimeIntervalEntity(
      {super.id,
      super.order,
      super.createdAt,
      super.creatorId,
      super.description,
      required this.mainTaskId,
      required this.subTaskId,
      required this.startAt,
      this.endAt,
      Duration? spentTime})
      : spentTime = (endAt != null && spentTime == null)
            ? (endAt.isAfter(startAt)
                ? endAt.difference(startAt)
                : throw ArgumentError('endAt must be after startAt'))
            : spentTime;

  /// Creates an empty `TimeIntervalEntity` with default values.
  ///
  /// This constructor is useful for initializing an entity with default values.
  TimeIntervalEntity.empty()
      : this(mainTaskId: '1', subTaskId: '2', startAt: DateTime(2024));

  /// Creates a copy of this `TimeIntervalEntity` with potentially modified properties.
  ///
  /// The `copyWith` method allows you to create a new instance of `TimeIntervalEntity`
  /// with some properties modified while keeping the rest unchanged.
  /// The `spentTime` is automatically calculated and cannot be directly customized or manipulated.
  TimeIntervalEntity copyWith({
    String? id,
    int? order,
    DateTime? createdAt,
    String? creatorId,
    String? description,
    String? mainTaskId,
    String? subTaskId,
    DateTime? startAt,
    DateTime? endAt,
  }) =>
      TimeIntervalEntity(
        id: id ?? this.id,
        order: order ?? this.order,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        creatorId: creatorId ?? this.creatorId,
        mainTaskId: mainTaskId ?? this.mainTaskId,
        subTaskId: subTaskId ?? this.subTaskId,
        startAt: startAt ?? this.startAt,
        endAt: endAt ?? this.endAt,
      );

  /// Returns a list of properties that are used to determine equality.
  ///
  /// This method is used by the `equatable` package to compare instances of
  /// `TimeIntervalEntity`.
  @override
  List<Object?> get props => [
        id,
        order,
        createdAt,
        creatorId,
        description,
        mainTaskId,
        subTaskId,
        startAt,
        endAt,
        spentTime,
      ];
}
