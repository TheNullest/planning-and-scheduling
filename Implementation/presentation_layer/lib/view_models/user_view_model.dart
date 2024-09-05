import 'package:presentation_layer/view_models/base_view_model_Abstraction.dart';
import 'package:domain_layer/use_cases/user_use_case.dart';
import 'package:domain_layer/dtos/user_dto.dart';
import 'package:data_layer/models/user_model.dart';

class UserViewModel
    extends BaseViewModelAbstraction<UserModel, UserDTO, UserUseCase> {
  UserViewModel() {
    useCase = UserUseCase();
  }

  @override
  void search({required query}) {
    isLoading = true;
    filteredEntities = entities!
        .where((entity) => entity.userName
            .toLowerCase()
            .contains(query.userName.toLowerCase()))
        .toList();
    isLoading = false;
  }
}
