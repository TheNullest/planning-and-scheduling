import 'package:flutter/material.dart';
import 'package:zamaan/data/enums.dart';
import 'package:zamaan/model/group_model.dart';
import 'package:zamaan/model/models.dart';

final List<UserModel> users = [
  UserModel(
    id: 1,
    userName: 'Mpersia',
    password: '123456',
    firstName: 'Yaavar',
    lastName: 'MJanlou',
    birthDate: DateTime.parse('1989-12-23'),
    emailAddress: 'mpersia4@hotmail.com',
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
      id: 03,
      tagName: 'CSS',
      description: 'برنامه نویسی با سی شارپ',
      color: Colors.blue,
      icon: Icons.css_sharp),
  TagModel(
      id: 01,
      tagName: 'خانگی',
      description: 'Sports',
      color: Colors.white,
      icon: Icons.sports),
  TagModel(
      id: 02,
      tagName: 'برنامه',
      description: 'Books',
      color: Colors.green,
      icon: Icons.book),
  TagModel(
      id: 03,
      tagName: 'هر چی',
      description: 'Working',
      color: Colors.blue,
      icon: Icons.work),
];

final List<MainTaskModel> tasks = [
  MainTaskModel(
      id: 01,
      creatorId: 01,
      groupId: 2,
      contributorsId: [2],
      mainTaskName: 'Working in the mine',
      description: 'Mining is not ez',
      fixedTagsId: [3],
      creationDate: DateTime.parse('2024-04-07'),
      deadline: DateTime.parse('2024-06-07'),
      color: Colors.red,
      icon: Icons.dining,
      importance: Importance.important),
  MainTaskModel(
      id: 02,
      creatorId: 02,
      groupId: 1,
      mainTaskName: 'Reading a book',
      description: 'it is not real',
      fixedTagsId: [3],
      creationDate: DateTime.parse('2024-04-02'),
      color: Colors.purple,
      icon: Icons.library_books,
      importance: Importance.medium),
];
