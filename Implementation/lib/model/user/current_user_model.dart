import '../../data/data.dart';

class CurrentUserModel {
  late int id;
  final String userName;
  final String passWord;

  CurrentUserModel({required this.userName, required this.passWord}) {
    id = users
        .where((user) => user.userName == userName && user.password == passWord)
        .first
        .id;
  }
}
