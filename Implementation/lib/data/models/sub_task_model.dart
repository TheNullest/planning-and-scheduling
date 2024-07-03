import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:zamaan/data/models.dart';
import 'package:zamaan/utilities/enums.dart';

part 'sub_task_model.g.dart';

@HiveType(typeId: 6)
class SubTaskModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final UserModel creator;

  @HiveField(2)
  final MainTaskModel maintTask;

  @HiveField(3)
  final Importance importance;

  @HiveField(4)
  final String subTaskName;

  @HiveField(5)
  final String? description;

  /// If the subtask is completed\
  /// and there is no need to repeat it
  @HiveField(6)
  final bool isDone;

  SubTaskModel.create({
    required this.creator,
    required this.maintTask,
    required this.subTaskName,
    required this.description,
    required this.importance,
    this.isDone = false,
  }) : id = const Uuid().v4();

  SubTaskModel({
    required this.id,
    required this.creator,
    required this.maintTask,
    required this.subTaskName,
    required this.description,
    required this.importance,
    this.isDone = false,
  });
}
