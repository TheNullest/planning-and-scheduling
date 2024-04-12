class UserModel {
  final int id;
  final String userName;
  final String password;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final String emailAddress;
  final String profileImagePath;

  UserModel(
      {required this.id,
      required this.userName,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.birthDate,
      required this.emailAddress,
      required this.profileImagePath});
}
