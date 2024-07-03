import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String userName;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String firstName;

  @HiveField(4)
  final String lastName;

  @HiveField(5)
  final DateTime birthDate;

  @HiveField(6)
  final String emailAddress;

  @HiveField(7)
  final String profileImagePath;

  UserModel.create({
    required this.userName,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.emailAddress,
    required this.profileImagePath,
  }) : id = const Uuid().v4();

  UserModel({
    required this.id,
    required this.userName,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.emailAddress,
    required this.profileImagePath,
  });
}
