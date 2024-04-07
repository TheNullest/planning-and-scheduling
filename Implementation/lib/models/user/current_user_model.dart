import '../../data/data.dart';

class CurrentUserModel {
  late int currentUserId;
  final String userName;
  final String passWord;

  CurrentUserModel({required this.userName, required this.passWord}) {
    currentUserId = users
        .where((user) => user.userName == userName && user.password == passWord)
        .first
        .userId;
  }
}
