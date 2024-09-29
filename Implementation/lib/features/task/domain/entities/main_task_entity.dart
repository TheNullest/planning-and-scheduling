import 'package:hive/hive.dart';
import 'package:zamaan/core/entities/base_entity_abstraction.dart';
import 'package:zamaan/core/utils/enums/enums.dart';

class MainTaskEntity extends BaseEntityAbstraction {
  @HiveField(4)
  final String title;

  /// Store the color value as an integer
  @HiveField(5)
  final int colorCode;

  ///Instead of saving the entire icon, save its IconData
  @HiveField(6)
  final int iconCode;

  @HiveField(7)
  final int priority;

  @HiveField(8)
  final DateTime? dueDate;

  /// Groups such as : sporting, reading, working, fun ,...
  @HiveField(11)
  final List<String>? categoryIds;

  @HiveField(12)
  final List<String>? fixedTagIds;

  @HiveField(13)
  final List<String>? tagIds;

  @HiveField(14)
  final Duration? totalSpentTime;

  /// Status == 0 => notStarted\
  /// Status == 1 => inProgress\
  /// Status == 2 => completed
  @HiveField(15)
  final int status;

  @HiveField(16)
  final String? taskSchedulerId;

  MainTaskEntity(
      {super.id,
      super.order,
      super.creatorId,
      super.description,
      required this.title,
      required this.categoryIds,
      super.createdAt,
      required this.colorCode,
      required this.iconCode,
      int? priority,
      int? status,
      this.fixedTagIds,
      this.tagIds,
      this.dueDate,
      this.totalSpentTime,
      this.taskSchedulerId})
      : priority = priority ?? Priority.optional.index,
        status = status ?? Status.notStarted.index;

  MainTaskEntity.empty()
      : this(title: 'title', categoryIds: [], colorCode: 1, iconCode: 2);

  /// Creates a copy of this MainTaskEntity with potentially modified properties.
  MainTaskEntity copyWith({
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
  }) =>
      MainTaskEntity(
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
        taskSchedulerId: taskSchedulerEntityId ?? taskSchedulerId,
      );

  @override
  List<Object?> get props => [
        id,
        order,
        creatorId,
        description,
        title,
        categoryIds,
        createdAt,
        colorCode,
        iconCode,
        priority,
        status,
        fixedTagIds,
        tagIds,
        dueDate,
        totalSpentTime,
        taskSchedulerId
      ];
}
