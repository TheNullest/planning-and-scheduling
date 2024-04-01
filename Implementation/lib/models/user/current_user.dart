import '../../data/data.dart';

class CurrentUser {
  late int currentUserId;
  final String userName;
  final String passWord;

  CurrentUser({required this.userName, required this.passWord}) {
    currentUserId = users
        .where((user) => user.userName == userName && user.password == passWord)
        .first
        .userId;
  }
}
