import 'package:hive/hive.dart';
import 'bases/base_type_adapter_asbtraction.dart';
import 'models.dart';

part 'main_task_model.g.dart';

@HiveType(typeId: 1)
class MainTaskModel extends BaseModelAbstraction {
  @HiveField(2)
  final String title;

  @HiveField(3)
  final DateTime creationDate;

  /// Store the color value as an integer
  @HiveField(4)
  final int colorCode;

  ///Instead of saving the entire icon, save its IconData
  @HiveField(5)
  final int iconCode;

  @HiveField(6)
  final int priority;

  @HiveField(8)
  final DateTime? dueTime;

  @HiveField(9)
  final int? repetitionInterval;

  /// Groups such as : sport, reading, working, fun ,...
  @HiveField(10)
  final List<String>? taskCategoriesId;

  @HiveField(11)
  final List<String>? fixedTagsId;

  @HiveField(12)
  final List<String>? tagsId;

  /// Store all time spent based on miliseconds in TaskDoingTimFrameModels
  @HiveField(13)
  int? totalSpentTime;

  /// If the task is completed\
  /// and there is no need to repeat it
  @HiveField(14)
  bool completed = false;

  /// Working with the presence and help of other people
  @HiveField(15)
  final List<String>? contributorsId;

  @HiveField(16)
  final String? superMainTaskId;

  MainTaskModel(
      {required super.id,
      super.creatorId,
      super.description,
      required this.title,
      required this.taskCategoriesId,
      required this.creationDate,
      required this.colorCode,
      required this.iconCode,
      required this.priority,
      this.contributorsId,
      this.superMainTaskId,
      this.fixedTagsId,
      this.tagsId,
      this.dueTime,
      this.repetitionInterval,
      this.totalSpentTime = 0,
      this.completed = false});
}
