import 'package:zamaan/models/user_model.dart';
import 'package:zamaan/view_models/dtos/dto_abstract.dart';

class UserDTO extends DTOAbstract<UserModel> {
  final String userName;

  final String password;

  final String firstName;

  final String lastName;

  final DateTime birthDate;

  final String emailAddress;

  final String? profileImagePath;

  UserDTO({
    required super.id,
    required this.userName,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.emailAddress,
    this.profileImagePath,
  });
  factory UserDTO.fromModel({
    required UserModel userModel,
  }) =>
      UserDTO(
          id: userModel.id,
          userName: userModel.userName,
          password: userModel.password,
          firstName: userModel.firstName,
          lastName: userModel.lastName,
          birthDate: userModel.birthDate,
          emailAddress: userModel.emailAddress,
          profileImagePath: userModel.profileImagePath);
}
