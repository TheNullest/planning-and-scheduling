import 'package:flutter/material.dart';
import 'package:zamaan/models/models.dart';

final List<UserModel> users = [
  UserModel(
    userId: 1,
    userName: 'Mpersia',
    password: '123456',
    firstName: 'Moien',
    lastName: 'MJanlou',
    birthDate: DateTime.parse('1989-12-23'),
    emailAddress: 'mpersia4@hotmail.com',
    profileImagePath: 'assets/images/profile_images/image1.jpg',
  ),
  UserModel(
    userId: 2,
    userName: 'TheNull',
    password: '654321',
    firstName: 'Moien',
    lastName: 'Janlou',
    birthDate: DateTime.parse('1989-12-22'),
    emailAddress: 'mpersia4@gmail.com',
    profileImagePath: 'assets/images/profile_images/image2.jpg',
  ),
  UserModel(
    userId: 3,
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

final List<TagModel> tags = [
  TagModel(
      tagId: 01,
      tagName: 'Sport',
      description: 'Sports',
      color: Colors.white,
      icon: Icons.sports),
  TagModel(
      tagId: 02,
      tagName: 'Book',
      description: 'Books',
      color: Colors.green,
      icon: Icons.book),
  TagModel(
      tagId: 03,
      tagName: 'Work',
      description: 'Working',
      color: Colors.blue,
      icon: Icons.work),
];
final List<TaskModel> tasks = [
  TaskModel(
      taskId: 01,
      creatorId: 01,
      contributorsId: [2],
      taskName: 'Working in the mine',
      description: 'Mining is not ez',
      fixedTagsId: [3],
      dateCreated: DateTime.parse('2024-04-07'),
      deadline: DateTime.parse('2024-06-07'),
      color: Colors.red,
      icon: Icons.dining,
      priority: 2),
  TaskModel(
      taskId: 02,
      creatorId: 02,
      taskName: 'Reading a book',
      description: 'it is not real',
      fixedTagsId: [3],
      dateCreated: DateTime.parse('2024-04-02'),
      color: Colors.purple,
      icon: Icons.library_books,
      priority: 5),
];
