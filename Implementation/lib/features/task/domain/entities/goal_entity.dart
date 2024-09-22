import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';

class GoalEntity extends BaseEntityAbstraction {
  @HiveField(4)
  final String mainTaskId;

  @HiveField(5)
  final String? subTaskId;

  /// The unit of measurment chosen to create the target and goal
  @HiveField(6)
  final String measurementUnitId;

  /// The minimum amount determined per hour\
  /// based on the desired measurement unit of the current task
  @HiveField(7)
  final double perHour;

  /// The minimum amount determined per day\
  /// based on the desired measurement unit of the current task
  @HiveField(8)
  final double perDay;

  /// The minimum amount determined per week\
  /// based on the desired measurement unit of the current task
  @HiveField(9)
  final double perWeek;

  /// The minimum amount determined per month\
  /// based on the desired measurement unit of the current task
  @HiveField(10)
  final double perMonth;

  /// The minimum amount determined per year\
  /// based on the desired measurement unit of the current task
  @HiveField(11)
  final double perYear;

  GoalEntity({
    super.id,
    super.order,
    super.createdAt,
    super.creatorId,
    super.description,
    required this.mainTaskId,
    required this.measurementUnitId,
    this.subTaskId,
    this.perHour = 0,
    this.perDay = 0,
    this.perWeek = 0,
    this.perMonth = 0,
    this.perYear = 0,
  });

  GoalEntity copyWith(
    String? id,
    int? order,
    DateTime? createdAt,
    String? creatorId,
    String? description,
    String? mainTaskId,
    String? measurementUnitId,
    String? subTaskId,
    double? perHour,
    double? perDay,
    double? perWeek,
    double? perMonth,
    double? perYear,
  ) =>
      GoalEntity(
        id: id ?? this.id,
        order: order ?? this.order,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        creatorId: creatorId ?? this.creatorId,
        mainTaskId: mainTaskId ?? this.mainTaskId,
        subTaskId: subTaskId ?? this.subTaskId,
        measurementUnitId: measurementUnitId ?? this.measurementUnitId,
        perHour: perHour ?? this.perHour,
        perDay: perDay ?? this.perDay,
        perWeek: perWeek ?? this.perWeek,
        perMonth: perMonth ?? this.perMonth,
        perYear: perYear ?? this.perYear,
      );

  @override
  List<Object?> get props => [
        id,
        order,
        createdAt,
        creatorId,
        description,
        mainTaskId,
        measurementUnitId,
        subTaskId,
        perHour,
        perDay,
        perWeek,
        perMonth,
        perYear,
      ];

  @override
  BaseEntityAbstraction fromEntity(BaseEntityAbstraction entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  GoalEntity toEntity() {
    // TODO: implement toEntity
    throw UnimplementedError();
  }
}
