import 'package:zamaan/models/models.dart';

final List<User> users = [
  User(
    userId: 1,
    userName: 'Mpersia',
    password: '123456',
    firstName: 'Moien',
    lastName: 'MJanlou',
    birthDate: DateTime.parse('1989-12-23'),
    emailAddress: 'mpersia4@hotmail.com',
    profileImagePath: 'assets/images/profile_images/image1.jpg',
  ),
  User(
    userId: 2,
    userName: 'TheNull',
    password: '654321',
    firstName: 'Moien',
    lastName: 'Janlou',
    birthDate: DateTime.parse('1989-12-22'),
    emailAddress: 'mpersia4@gmail.com',
    profileImagePath: 'assets/images/profile_images/image2.jpg',
  ),
  User(
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

final CurrentUser currentUser =
    CurrentUser(userName: 'MoienJanlou', passWord: 'Aa123456');
