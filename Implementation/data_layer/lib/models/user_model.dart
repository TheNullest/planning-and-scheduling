import 'package:hive/hive.dart';
import 'package:zamaan/models/bases/base_type_adapter_asbtract.dart';
import 'package:zamaan/models/models.dart';

part 'user_model.g.dart';

@HiveType(typeId: 8)
class UserModel extends BaseModelAbstraction {
  @HiveField(2)
  final String userName;

  @HiveField(8)
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
  final String? profileImagePath;

  UserModel({
    required super.id,
    super.description,
    required this.userName,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.emailAddress,
    required this.profileImagePath,
  });
}
