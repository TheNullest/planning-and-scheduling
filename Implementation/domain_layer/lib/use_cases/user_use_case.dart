import 'package:data_layer/models/user_model.dart';
import 'package:data_layer/repositories/hive_user_repo.dart';
import 'package:domain_layer/dtos/user_dto.dart';
import 'package:domain_layer/use_cases/use_case_abstraction.dart';

class UserUseCase extends UseCaseAbstraction<UserModel, HiveUserRepo, UserDTO> {
  @override
  UserDTO fromModel(UserModel model) => UserDTO.fromModel(model: model);
}
