import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:zamaan/data/models.dart';

part 'task_doing_time_frame_model.g.dart';

@HiveType(typeId: 3)
class TaskDoingTimeFrameModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final UserModel creator;

  @HiveField(2)
  final MainTaskModel mainTask;

  @HiveField(3)
  final SubTaskModel? subTask;

  @HiveField(4)
  final DateTime startAt;

  @HiveField(5)
  final DateTime? endAt;

  @HiveField(6)
  final Duration spentTime;

  TaskDoingTimeFrameModel.create({
    required this.mainTask,
    required this.subTask,
    required this.startAt,
    required this.spentTime,
    this.endAt,
  })  : id = const Uuid().v4(),
        creator = UserModel.create(
            userName: 'userName',
            password: 'password',
            firstName: 'firstName',
            lastName: 'lastName',
            birthDate: DateTime.now(),
            emailAddress: 'emailAddress',
            profileImagePath: 'profileImagePath');

  TaskDoingTimeFrameModel({
    required this.id,
    required this.creator,
    required this.mainTask,
    required this.subTask,
    required this.startAt,
    required this.spentTime,
    this.endAt,
  });
}
