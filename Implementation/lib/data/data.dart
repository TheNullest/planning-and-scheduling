import 'package:flutter/material.dart';
import 'package:zamaan/utilities/enums.dart';
import 'package:zamaan/model/models.dart';

final List<UserModel> users = [
  UserModel(
    id: 1,
    userName: 'Mpersia',
    password: '123456',
    firstName: 'Yaavar',
    lastName: 'MJanlou',
    birthDate: DateTime.parse('1989-12-23'),
    emailAddress: 'moien.janlou@outlook.com',
    profileImagePath: 'assets/images/profile_images/image1.jpg',
  ),
  UserModel(
    id: 2,
    userName: 'TheNull',
    password: '654321',
    firstName: 'Rohan',
    lastName: 'Janlou',
    birthDate: DateTime.parse('1989-12-22'),
    emailAddress: 'mpersia4@gmail.com',
    profileImagePath: 'assets/images/profile_images/image2.jpg',
  ),
  UserModel(
    id: 3,
    userName: 'MoienJanlou',
    password: 'Aa123456',
    firstName: 'Moien',
    lastName: 'MahmoudJanlou',
    birthDate: DateTime.parse('1989-12-23'),
    emailAddress: 'mpersia4@gmail.com',
    profileImagePath: 'assets/images/profile_images/image3.jpg',
  ),
];

final CurrentUserModel currentUserModel =
    CurrentUserModel(userName: 'MoienJanlou', passWord: 'Aa123456');

final List<GorupModel> groups = [
  GorupModel(
      id: 01,
      groupName: 'ورزش',
      description: 'هر ورزشی',
      color: Colors.white,
      icon: Icons.sports),
  GorupModel(
      id: 02,
      groupName: 'کتاب خوندن',
      description: 'کتاب بخون',
      color: Colors.green,
      icon: Icons.book),
  GorupModel(
      id: 03,
      groupName: 'کار',
      description: 'درامد داشتن',
      color: Colors.blue,
      icon: Icons.work),
];

final List<TagModel> tags = [
  TagModel(
      id: 01,
      tagName: 'CSS',
      description: 'برنامه نویسی با سی شارپ',
      color: Colors.blue,
      icon: Icons.css_sharp),
  TagModel(
      id: 02,
      tagName: 'خانگی',
      description: 'در خانه انجام میشه',
      color: Colors.white,
      icon: Icons.sports),
  TagModel(
      id: 03,
      tagName: 'برنامه',
      description: 'Books',
      color: Colors.green,
      icon: Icons.book),
  TagModel(
      id: 04,
      tagName: 'سرگرمی',
      description: 'فان',
      color: Colors.blue,
      icon: Icons.work),
  TagModel(
      id: 05,
      tagName: 'رمان',
      description: 'Working',
      color: Colors.blue,
      icon: Icons.work),
];

class ProjectModelProvider extends ChangeNotifier {
  // MainTaskModel
  final List<MainTaskModel> _mainTasks = [
    MainTaskModel(
      id: 1,
      creatorId: users[0],
      groupId: groups[2],
      contributorsId: [2],
      mainTaskName: 'برنامه نویسی',
      description: 'Mining is not ez',
      fixedTagsId: [3],
      creationDate: DateTime.parse('2024-04-07'),
      deadline: DateTime.parse('2024-06-07'),
      color: Colors.blue,
      icon: Icons.code,
      importance: Importance.important,
      repeat: RepetitionInterval.daily,
    ),
    MainTaskModel(
      id: 2,
      creatorId: users[1],
      groupId: groups[1],
      contributorsId: [2],
      mainTaskName: 'Working in the mine',
      description: 'Mining is not ez',
      fixedTagsId: [3],
      creationDate: DateTime.parse('2024-04-07'),
      deadline: DateTime.parse('2024-06-07'),
      color: Colors.red,
      icon: Icons.work,
      importance: Importance.important,
      repeat: RepetitionInterval.weekly,
    ),
    MainTaskModel(
      id: 02,
      creatorId: users[1],
      groupId: groups[1],
      tagsId: [5, 4],
      mainTaskName: 'سگ تو روحت',
      description: 'it is not real',
      fixedTagsId: [3],
      creationDate: DateTime.parse('2024-04-02'),
      color: Colors.purple,
      icon: Icons.animation,
      repeat: RepetitionInterval.daily,
      importance: Importance.medium,
    ),
    MainTaskModel(
      id: 02,
      creatorId: users[1],
      groupId: groups[1],
      tagsId: [5, 4],
      mainTaskName: 'هر بار که میروی',
      description: 'it is not real',
      fixedTagsId: [3],
      creationDate: DateTime.parse('2024-04-02'),
      color: Colors.cyan,
      icon: Icons.arrow_back,
      repeat: RepetitionInterval.yearly,
      importance: Importance.medium,
    ),
    MainTaskModel(
      id: 02,
      creatorId: users[1],
      groupId: groups[1],
      tagsId: [5, 4],
      mainTaskName: 'سرباز فراری',
      description: 'it is not real',
      fixedTagsId: [3],
      creationDate: DateTime.parse('2024-04-02'),
      color: Colors.indigo,
      icon: Icons.social_distance,
      repeat: RepetitionInterval.daily,
      importance: Importance.medium,
    ),
    MainTaskModel(
      id: 02,
      creatorId: users[1],
      groupId: groups[1],
      tagsId: [5, 4],
      mainTaskName: 'سگ بی دست و پا',
      description: 'it is not real',
      fixedTagsId: [3],
      creationDate: DateTime.parse('2024-04-02'),
      color: Colors.purple,
      icon: Icons.handshake,
      repeat: RepetitionInterval.daily,
      importance: Importance.medium,
    ),
    MainTaskModel(
      id: 02,
      creatorId: users[1],
      groupId: groups[1],
      tagsId: [5, 4],
      mainTaskName: ' چهل تا',
      description: 'it is not real',
      fixedTagsId: [3],
      creationDate: DateTime.parse('2024-04-02'),
      color: Colors.orange,
      icon: Icons.numbers,
      repeat: RepetitionInterval.daily,
      importance: Importance.medium,
    ),
    MainTaskModel(
      id: 02,
      creatorId: users[1],
      groupId: groups[1],
      tagsId: [5, 4],
      mainTaskName: ' رمان جدید',
      description: 'it is not real',
      fixedTagsId: [3],
      creationDate: DateTime.parse('2024-04-02'),
      color: Colors.black,
      icon: Icons.library_books,
      repeat: RepetitionInterval.daily,
      importance: Importance.medium,
    ),
    MainTaskModel(
        id: 02,
        creatorId: users[1],
        groupId: groups[1],
        tagsId: [5, 4],
        mainTaskName: ' 2رمان جدید',
        description: 'it is not real',
        fixedTagsId: [3],
        creationDate: DateTime.parse('2024-04-02'),
        color: Colors.green,
        icon: Icons.library_books,
        repeat: RepetitionInterval.daily,
        importance: Importance.medium,
        isDone: true),
  ];
  void addTask(MainTaskModel task) {
    _mainTasks.add(task);
    notifyListeners();
  }

  List<MainTaskModel> get tasks => _mainTasks;

  // TaskDoingTimeFrameModel
  final List<TaskDoingTimeFrameModel> _taskDoingTimeFrames = [
    TaskDoingTimeFrameModel(
      id: 01,
      userId: 1,
      mainTaskId: 01,
      subTaskId: null,
      startAt: DateTime(2024, 06, 10, 15, 25, 30),
      endAt: DateTime(2024, 06, 10, 17, 0, 0),
    ),
    TaskDoingTimeFrameModel(
      id: 02,
      userId: 1,
      mainTaskId: 01,
      subTaskId: null,
      startAt: DateTime(2024, 06, 10, 17, 45, 30),
      endAt: DateTime(2024, 06, 10, 18, 45, 0),
    ),
    TaskDoingTimeFrameModel(
      id: 03,
      userId: 1,
      mainTaskId: 01,
      subTaskId: null,
      startAt: DateTime(2024, 06, 10, 20, 45, 30),
      endAt: DateTime(2024, 06, 10, 22, 5, 0),
    ),
  ];
  set addTaskDoingTimeFrame(TaskDoingTimeFrameModel timeFrame) {
    _taskDoingTimeFrames.add(timeFrame);
    notifyListeners();
  }

  List<TaskDoingTimeFrameModel> get getTaskDoingTimeFrame =>
      _taskDoingTimeFrames;
}
