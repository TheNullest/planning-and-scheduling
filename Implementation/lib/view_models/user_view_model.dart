import 'package:zamaan/models/models.dart';
import 'package:zamaan/repositories/hive_repositories.dart';
import 'package:zamaan/view_models/base_view_model.dart';
import 'package:zamaan/view_models/dtos/dtos.dart';

class UserViewModel extends BaseViewModel<UserDTO, UserModel, HiveUsersRepo> {
  UserViewModel({required super.repository});

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

  @override
  modelToDTOConverter({required model}) => UserDTO.fromModel(userModel: model);
}
