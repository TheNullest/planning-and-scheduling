import 'package:zamaan/models/models.dart';
import 'package:zamaan/repositories/hive_repositories.dart';
import 'package:zamaan/view_models/base_view_model.dart';

class UserViewModel extends BaseViewModel<UserModel, HiveUsersRepo> {
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
}
