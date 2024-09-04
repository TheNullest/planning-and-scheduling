// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
// import 'package:zamaan/utilities/enums.dart';
// import 'package:zamaan/model/models.dart';

// final List<UserModel> users = [
//   UserModel(
//     id: 1,
//     userName: 'Mpersia',
//     password: '123456',
//     firstName: 'Yaavar',
//     lastName: 'MJanlou',
//     birthDate: DateTime.parse('1989-12-23'),
//     emailAddress: 'moien.janlou@outlook.com',
//     profileImagePath: 'assets/images/profile_images/image1.jpg',
//   ),
//   UserModel(
//     id: 2,
//     userName: 'TheNull',
//     password: '654321',
//     firstName: 'Rohan',
//     lastName: 'Janlou',
//     birthDate: DateTime.parse('1989-12-22'),
//     emailAddress: 'mpersia4@gmail.com',
//     profileImagePath: 'assets/images/profile_images/image2.jpg',
//   ),
//   UserModel(
//     id: 3,
//     userName: 'MoienJanlou',
//     password: 'Aa123456',
//     firstName: 'Moien',
//     lastName: 'MahmoudJanlou',
//     birthDate: DateTime.parse('1989-12-23'),
//     emailAddress: 'mpersia4@gmail.com',
//     profileImagePath: 'assets/images/profile_images/image3.jpg',
//   ),
// ];

// final CurrentUserModel currentUserModel =
//     CurrentUserModel(userName: 'MoienJanlou', passWord: 'Aa123456');

// final List<GorupModel> groups = [
//   GorupModel(
//       id: Uuid().v4(),
//       groupName: 'ورزش',
//       description: 'هر ورزشی',
//       color: Colors.white,
//       icon: Icons.sports),
//   GorupModel(
//       id: Uuid().v4(),
//       groupName: 'کتاب خوندن',
//       description: 'کتاب بخون',
//       color: Colors.green,
//       icon: Icons.book),
//   GorupModel(
//       id: Uuid().v4(),
//       groupName: 'کار',
//       description: 'درامد داشتن',
//       color: Colors.blue,
//       icon: Icons.work),
// ];

// final List<TagModel> tags = [
//   TagModel(
//       id: 01,
//       tagName: 'CSS',
//       description: 'برنامه نویسی با سی شارپ',
//       color: Colors.blue,
//       icon: Icons.css_sharp),
//   TagModel(
//       id: 02,
//       tagName: 'خانگی',
//       description: 'در خانه انجام میشه',
//       color: Colors.white,
//       icon: Icons.sports),
//   TagModel(
//       id: 03,
//       tagName: 'برنامه',
//       description: 'Books',
//       color: Colors.green,
//       icon: Icons.book),
//   TagModel(
//       id: 04,
//       tagName: 'سرگرمی',
//       description: 'فان',
//       color: Colors.blue,
//       icon: Icons.work),
//   TagModel(
//       id: 05,
//       tagName: 'رمان',
//       description: 'Working',
//       color: Colors.blue,
//       icon: Icons.work),
// ];

// class ProjectModelProvider extends ChangeNotifier {
//   // MainTaskModel
//   final List<MainTaskModel> _mainTasks = [
//     MainTaskModel(
//       id: Uuid().v4(),
//       creator: users[0],
//       memberOfGroup: groups[2],
//       contributorsId: [2],
//       title: 'برنامه نویسی',
//       description: 'Mining is not ez',
//       fixedTagsId: [3],
//       creationDate: DateTime.parse('2024-04-07'),
//       deadline: DateTime.parse('2024-06-07'),
//       color: Colors.blue,
//       icon: Icons.code,
//       importance: Importance.important,
//       repeat: RepetitionInterval.daily,
//       goal: TaskGoalModel(
//         id: Uuid().v4(),
//         mainTaskModelId: Uuid().v4(),
//         daily: const Duration(hours: 7, minutes: 45),
//       ),
//       totalSpentTime: const Duration(hours: 7, minutes: 30, seconds: 30),
//     ),
//     MainTaskModel(
//       id: Uuid().v4(),
//       creator: users[1],
//       memberOfGroup: groups[1],
//       contributorsId: [2],
//       title: 'Working in the mine',
//       description: 'Mining is not ez',
//       fixedTagsId: [3],
//       creationDate: DateTime.parse('2024-04-07'),
//       deadline: DateTime.parse('2024-06-07'),
//       color: Colors.red,
//       icon: Icons.work,
//       importance: Importance.important,
//       repeat: RepetitionInterval.weekly,
//       goal: TaskGoalModel(
//         id: Uuid().v4(),
//         mainTaskModelId: Uuid().v4(),
//         daily: const Duration(hours: 8),
//       ),
//     ),
//     MainTaskModel(
//       id: Uuid().v4(),
//       creator: users[1],
//       memberOfGroup: groups[1],
//       tagsId: [5, 4],
//       title: 'سگ تو روحت',
//       description: 'it is not real',
//       fixedTagsId: [3],
//       creationDate: DateTime.parse('2024-04-02'),
//       color: Colors.purple,
//       icon: Icons.animation,
//       repeat: RepetitionInterval.daily,
//       importance: Importance.medium,
//       goal: TaskGoalModel(
//         id: Uuid().v4(),
//         mainTaskModelId: Uuid().v4(),
//         daily: const Duration(hours: 8),
//       ),
//     ),
//     MainTaskModel(
//       id: Uuid().v4(),
//       creator: users[1],
//       memberOfGroup: groups[1],
//       tagsId: [5, 4],
//       title: 'هر بار که میروی',
//       description: 'it is not real',
//       fixedTagsId: [3],
//       creationDate: DateTime.parse('2024-04-02'),
//       color: Colors.cyan,
//       icon: Icons.arrow_back,
//       repeat: RepetitionInterval.yearly,
//       importance: Importance.medium,
//       goal: TaskGoalModel(
//         id: Uuid().v4(),
//         mainTaskModelId: Uuid().v4(),
//         daily: const Duration(hours: 5),
//       ),
//     ),
//     MainTaskModel(
//         id: Uuid().v4(),
//         creator: users[1],
//         memberOfGroup: groups[1],
//         tagsId: [5, 4],
//         title: 'سرباز فراری',
//         description: 'it is not real',
//         fixedTagsId: [3],
//         creationDate: DateTime.parse('2024-04-02'),
//         color: Colors.indigo,
//         icon: Icons.social_distance,
//         repeat: RepetitionInterval.daily,
//         importance: Importance.medium,
//         totalSpentTime: const Duration(hours: 4, minutes: 37),
//         isDone: false),
//     MainTaskModel(
//       id: Uuid().v4(),
//       creator: users[1],
//       memberOfGroup: groups[1],
//       tagsId: [5, 4],
//       title: 'سگ بی دست و پا',
//       description: 'it is not real',
//       fixedTagsId: [3],
//       creationDate: DateTime.parse('2024-04-02'),
//       color: Colors.purple,
//       icon: Icons.handshake,
//       repeat: RepetitionInterval.daily,
//       importance: Importance.medium,
//       goal: TaskGoalModel(
//         id: Uuid().v4(),
//         mainTaskModelId: Uuid().v4(),
//         daily: const Duration(hours: 4),
//       ),
//     ),
//     MainTaskModel(
//       id: Uuid().v4(),
//       creator: users[1],
//       memberOfGroup: groups[1],
//       tagsId: [5, 4],
//       title: ' چهل تا',
//       description: 'it is not real',
//       fixedTagsId: [3],
//       creationDate: DateTime.parse('2024-04-02'),
//       color: Colors.orange,
//       icon: Icons.numbers,
//       repeat: RepetitionInterval.daily,
//       importance: Importance.medium,
//       goal: TaskGoalModel(
//         id: Uuid().v4(),
//         mainTaskModelId: Uuid().v4(),
//         daily: const Duration(hours: 2),
//       ),
//     ),
//     MainTaskModel(
//       id: Uuid().v4(),
//       creator: users[1],
//       memberOfGroup: groups[1],
//       tagsId: [5, 4],
//       title: ' رمان جدید',
//       description: 'it is not real',
//       fixedTagsId: [3],
//       creationDate: DateTime.parse('2024-04-02'),
//       color: Colors.black,
//       icon: Icons.library_books,
//       repeat: RepetitionInterval.daily,
//       importance: Importance.medium,
//       goal: TaskGoalModel(
//         id: Uuid().v4(),
//         mainTaskModelId: Uuid().v4(),
//         daily: const Duration(hours: 1),
//       ),
//     ),
//     MainTaskModel(
//         id: Uuid().v4(),
//         creator: users[1],
//         memberOfGroup: groups[1],
//         tagsId: [5, 4],
//         title: ' 2رمان جدید',
//         description: 'it is not real',
//         fixedTagsId: [3],
//         creationDate: DateTime.parse('2024-04-02'),
//         color: Colors.green,
//         icon: Icons.library_books,
//         repeat: RepetitionInterval.daily,
//         importance: Importance.medium,
//         goal: TaskGoalModel(
//           id: Uuid().v4(),
//           mainTaskModelId: Uuid().v4(),
//           daily: const Duration(hours: 1, minutes: 20),
//         ),
//         isDone: true),
//   ];
//   void addTask(MainTaskModel task) {
//     _mainTasks.add(task);
//     notifyListeners();
//   }

//   List<MainTaskModel> get tasks => _mainTasks;

//   // TaskDoingTimeFrameModel
//   final List<TaskDoingTimeFrameModel> _taskDoingTimeFrames = [
//     TaskDoingTimeFrameModel(
//       id: 01,
//       userId: 1,
//       mainTaskId: 01,
//       subTaskId: null,
//       startAt: DateTime(2024, 06, 10, 15, 25, 30),
//       spentTime: const Duration(hours: 1, minutes: 34, seconds: 30),
//       endAt: DateTime(2024, 06, 10, 17, 0, 0),
//     ),
//     TaskDoingTimeFrameModel(
//       id: 02,
//       userId: 1,
//       mainTaskId: 01,
//       subTaskId: null,
//       startAt: DateTime(2024, 06, 10, 17, 45, 30),
//       spentTime: const Duration(hours: 0, minutes: 59, seconds: 30),
//       endAt: DateTime(2024, 06, 10, 18, 45, 0),
//     ),
//     TaskDoingTimeFrameModel(
//       id: 03,
//       userId: 1,
//       mainTaskId: 01,
//       subTaskId: null,
//       startAt: DateTime(2024, 06, 10, 20, 45, 30),
//       spentTime: const Duration(hours: 1, minutes: 19, seconds: 30),
//       endAt: DateTime(2024, 06, 10, 22, 5, 0),
//     ),
//   ];
//   set addTaskDoingTimeFrame(TaskDoingTimeFrameModel timeFrame) {
//     _taskDoingTimeFrames.add(timeFrame);
//     notifyListeners();
//   }

//   List<TaskDoingTimeFrameModel> get getTaskDoingTimeFrame =>
//       _taskDoingTimeFrames;
// }
