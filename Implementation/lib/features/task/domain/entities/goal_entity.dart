import 'package:hive/hive.dart';
import 'package:zamaan/core/common/entities/base_entity_abstraction.dart';

class GoalEntity extends BaseEntityAbstraction {
  GoalEntity({
    required this.mainTaskId,
    required this.measurementUnitId,
    required this.measurementValue,
    super.id,
    super.createdAt,
    super.updatedAt,
    super.userId,
    super.description,
    this.subTaskId,
    this.perActiveHour = 0,
    this.perActiveDay = 0,
    this.perActiveWeek = 0,
    this.perActiveMonth = 0,
    this.perActiveYear = 0,
  });

  GoalEntity.empty()
      : this(mainTaskId: '1', measurementUnitId: '2', measurementValue: 1);
  @HiveField(4)
  final String mainTaskId;

  @HiveField(5)
  final String? subTaskId;

  /// The unit of measurment chosen to create the target and goal
  @HiveField(6)
  final String measurementUnitId;

  /// MeasurementValue enum
  @HiveField(7)
  final int measurementValue;

  /// The minimum amount determined per hour\
  /// based on the desired measurement unit of the current task
  @HiveField(8)
  final double perActiveHour;

  /// The minimum amount determined per day\
  /// based on the desired measurement unit of the current task
  @HiveField(9)
  final double perActiveDay;

  /// The minimum amount determined per week\
  /// based on the desired measurement unit of the current task
  @HiveField(10)
  final double perActiveWeek;

  /// The minimum amount determined per month\
  /// based on the desired measurement unit of the current task
  @HiveField(11)
  final double perActiveMonth;

  /// The minimum amount determined per year\
  /// based on the desired measurement unit of the current task
  @HiveField(12)
  final double perActiveYear;

  GoalEntity toEntity() => GoalEntity(
        id: id,
        updatedAt: updatedAt,
        description: description,
        createdAt: createdAt,
        userId: userId,
        mainTaskId: mainTaskId,
        measurementUnitId: measurementUnitId,
        measurementValue: measurementValue,
        subTaskId: subTaskId,
        perActiveHour: perActiveHour,
        perActiveDay: perActiveDay,
        perActiveWeek: perActiveWeek,
        perActiveMonth: perActiveMonth,
        perActiveYear: perActiveYear,
      );

  @override
  GoalEntity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? description,
    String? mainTaskId,
    String? measurementUnitId,
    int? measurementValue,
    String? subTaskId,
    double? perActiveHour,
    double? perActiveDay,
    double? perActiveWeek,
    double? perActiveMonth,
    double? perActiveYear,
  }) =>
      GoalEntity(
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
        mainTaskId: mainTaskId ?? this.mainTaskId,
        subTaskId: subTaskId ?? this.subTaskId,
        measurementUnitId: measurementUnitId ?? this.measurementUnitId,
        measurementValue: measurementValue ?? this.measurementValue,
        perActiveHour: perActiveHour ?? this.perActiveHour,
        perActiveDay: perActiveDay ?? this.perActiveDay,
        perActiveWeek: perActiveWeek ?? this.perActiveWeek,
        perActiveMonth: perActiveMonth ?? this.perActiveMonth,
        perActiveYear: perActiveYear ?? this.perActiveYear,
      );

  @override
  List<Object?> get props => [
        id,
        updatedAt,
        createdAt,
        userId,
        description,
        mainTaskId,
        measurementUnitId,
        measurementValue,
        subTaskId,
        perActiveHour,
        perActiveDay,
        perActiveWeek,
        perActiveMonth,
        perActiveYear,
      ];
}
